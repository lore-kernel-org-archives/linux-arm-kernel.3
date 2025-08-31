Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4A0CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 13:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuVblRpOdjWQCfpwKse83LT8IgPkp+MhNhnqf1geLpk=; b=G0D7IFA6sykLKznYrd3wftdZuz
	rD/F8xJQj2x7yO80bj5ahlOBejFO8P08YE4UH2RjGnzkLtnMakjrZSKwv3HaMoo9DJPRTyAKnI6Jz
	gKlmMcIGA7tt+TkTjT447ujLz+792ERlLeEMfHeYFzHezDsbU7PsumOorRqgPaDs1psqZ1mlWOAKK
	0FVdrUuS7o713Y7c+7bJdwpxFo7nzw/aZbY3Slo1Q0sMHueqnb0tKsynLIvJ7RxFZBidJSxxo3KYb
	KTh6Jm7uPpwiUl6GWa9Rg5c0kwZupiu9MIChk3BQjzorPRiFwNNT3O7wKWc8teER51B17WDR5WdeS
	4F9GiOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usiH8-0000000AEoe-3cR2;
	Sun, 31 Aug 2025 13:39:18 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usi6V-0000000AE73-2R3z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 13:28:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3cef2c300afso410823f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646898; x=1757251698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuVblRpOdjWQCfpwKse83LT8IgPkp+MhNhnqf1geLpk=;
        b=KRog53uPNGV1BUmik55mOsHejc1QC/eylZQrrDMMppytGPr2Cqj+rii8cbi5gzvOE9
         AyGRSs8H6vuypdzZraEcmnShZyzXWprIHC3lgZdO34IA738hnuncPkHBj2TMl+ZDj6H1
         h15tMYtyOzLvIyyB4QqQBf+G/PIEkBg1MppsmCrGJqmBaPwfbiRwazZy23mwFXhFYvRb
         gzDWiJeGtcYw5A56hpkxO4jmSuO62gldJIm//vVRvXvQH0o6R0APmT6Se6SG51HLT+wi
         4+nNE4eDkUIdraEt3CtStAa7DuTL1Rij0GUZcxKsOcpdBVGA+V+AIB855nbGr6DOQhC0
         OSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646898; x=1757251698;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuVblRpOdjWQCfpwKse83LT8IgPkp+MhNhnqf1geLpk=;
        b=cQ31MiwWnyopBu60e7tB5WbchMCQpkAXHBbm5etDNz9fPht+HcCS9FEwFjleYS8e5z
         w0uIbxS6sjd8ucpOjVFB06ue1kz3P3iFrHQ551lOlW0YVz3FYuG8M5Gq1+mFi3EeTOBo
         SqjePisIq50ruYueZPU3cT43AhIU2yXsg8tnwo+CI6BCiaXtS1Z3Ch3n49Pca3q3afiQ
         XGkVZJiNB/4TNZX0OZvbBqda6tOlCpAKZgE3t7/uwznd1FBgB6XwiU4NMtYGHdfbm4/9
         roH1c4Ot9zZYx11T2r0de+058DTBVBkEbNKP3OuUtntvhKTDRsXq9qqz4YWDlYmSNXW7
         tKhw==
X-Forwarded-Encrypted: i=1; AJvYcCVyLEvE9oCCtGkQiMTHjsr38ElhIYgj+aGXdHyKhRUMRyUBHtqbABWFAUk2eT+YxFgPCX3ma3dipK92+IOsaako@lists.infradead.org
X-Gm-Message-State: AOJu0YzSuIEvdaDYa1Lwzs1BbyKWj9UtgpcUERtSFupOG4AVDzNfdSut
	tsfaLr4CHYHufGQQ2hsGEkMAeTIGxMRdvvuuCSOnlqWfXmeFAsDq/qcgkqrwX+WjV+E=
X-Gm-Gg: ASbGnctLUmxKgF+QXWVXTtvpZjr5QbMZhTjF3IBTz0d65+sO32dYi1+ShdeGYmdYPDE
	25TESNBvYnOeJwlqbdITIkUQVKb5kImhiMzUr37/ll+TIZJYFNm0D763YpB6r9+zVzhTXlo4XQg
	xBnUaWl+7HEgSe2jHHuFIbZ9z91Zmry3QgSvQr6YRxdMQM1C9lfZiQYf4U+MfLnkmdbtFER5mTQ
	kB0pFlRyTv4kCDElunCxzOBjJ2P24Vf8Mqki32Ek+L0pTE/H/OkGOkJnU/qyRt0PU8lqvoKC0PW
	bKCqjjffz7nBfdUaQ7Qv9+GzXvHmFQkYdmXs5N99icYM2IFugKMzdr2SCMcI/8wD6A/G2pp/WsB
	LJwjtppHww/DR3ZEBZAv+JghWk8ECsIO2mGf/av690Qm8KB49wfRP8lHAS18/
X-Google-Smtp-Source: AGHT+IGjjCRfDtUdQVx88kWUHZJxBBGxwDC32T0AevVKpXcpfKjnIqL3cEb2Sd3S+uivJb0HGuqySg==
X-Received: by 2002:a05:6000:2dc7:b0:3ca:6c06:70f3 with SMTP id ffacd0b85a97d-3d0f967dfa7mr3081239f8f.1.1756646897869;
        Sun, 31 Aug 2025 06:28:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250825114436.46882-7-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120725epcas5p36cdf2c4e839db307f1cc0dc81346b913@epcas5p3.samsung.com>
 <20250825114436.46882-7-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 06/10] dt-bindings: arm: Convert Axis
 board/soc bindings to json-schema
Message-Id: <175664689576.195158.13430798793147668085.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_062819_626816_EFBDC601 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Mon, 25 Aug 2025 17:14:32 +0530, Ravi Patel wrote:
> Convert Axis SoC bindings to DT schema format using json-schema.
> Existing bindings supports ARTPEC-6 SoC and board.
> 
> 

Applied, thanks!

[06/10] dt-bindings: arm: Convert Axis board/soc bindings to json-schema
        https://git.kernel.org/krzk/linux/c/ea0484e4b82b3496310a94684dfad5e61421f633

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


