Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A852BC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVQAurF+MYZJ7WaK0MhKpEumwF6uK/6mS+d/0X+gZ3g=; b=YBghF7nR45cxcx8zPp2J52kYMZ
	i4umqfvNdyM12qZSRs0kSsDLfrKHxIbBnnONWzYnBcUIuUSMDAnFo9ZZqBnwyiLkoHpDm+q5oCjcK
	aAqvabmB1rGraOmY0THnOOpuiXAyi8RORSk5FY6W3pozBF6X2s83ldKqUWV3Govoi8N/nJZDPyB6x
	AwEqgdc5BrD0M7BxEAUe0APaT4ZughvtjBexIvR4lPtTd+ClDpTUvHrLJLl/aLKhobCUUE1sKSK0z
	gH2o9zbzL+20Ghq/wMqNxoOHQXTF/tAhe5GLAKQDIjZs+XKeeXl/PiBvfc+Ef4N4IhhinA0dvgs5/
	0ca6csfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABSE-0000000EFe5-1L56;
	Fri, 25 Sep 2026 19:19:30 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABSB-0000000EFdJ-38hz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:19:28 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33e46a15703so1072747eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 12:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363966; x=1790968766; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cVQAurF+MYZJ7WaK0MhKpEumwF6uK/6mS+d/0X+gZ3g=;
        b=SOcv7JeYGocHAn2yas4S59LDUFx7Kvab6MxaOoGsHUYThXuXVBj3VBmvLFwv9GChug
         VthvW9GH9boIcvB3GxKw4k2+nZv3RYBC8dsNsrIwbKLN2f7WOtfr5dq9kQwwA14Lgq0f
         ysxKSdz2V5UvrIxqU5ZGR8BCi7yg6/YldTi6IGnEG9gofn7IrZ5lpQPG3jF2HqiveHsf
         xD52rSsmEdRc/YlaQY+r3lXZpSPG77KNSimepdoo2fG22k+InVkvbX7/r24y0lVqu/f2
         pQFmhDdLl9qmUAFwpe3uPu5/e4Z1gY2fXybs/cBpFenThEfbaDYM6Z406e4jzN+SY6sJ
         P+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363966; x=1790968766;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVQAurF+MYZJ7WaK0MhKpEumwF6uK/6mS+d/0X+gZ3g=;
        b=v5vooCN32KsnlAwvtWttPxvP+K7mJT066zSj4DWLOJyPF/tOkglc67+1o5HLY0kEZD
         S1VC4O9olcp8mfNxlQjM2FCE5aEctAgz6dngoB+pyx0BdEJn+2gzWAkz0+VhG0cHdoaG
         fX7gp2jG8Bbm/4kIYlDE/PUFfegJrZAq3dkE/Z+xvQVEBUXvQqZ5s3IDL1ngypHd890G
         /v1XhWxPi6ge5qFfCX1cnnPQ3KYrro4IT0s9ByFk+7rhYMfY9bI3HdkCgoru3s2kxPuv
         0Vihp375PboQ+xLRLIybwjsqSittpzxp4XhKNscw8YEKN1Iban6ZQjibd3Gy+Aokn7Bt
         yIUA==
X-Forwarded-Encrypted: i=1; AKwUvBxIUdK4hFqPDe8AdWDlfdxga7v1iqSHpYDpcdSVI/7xEBRNsgqzmXAi+rGkOlakpMKoiOjhh6DDh5YK4KHq3NtQ@lists.infradead.org
X-Gm-Message-State: AFuF++n+OkMTkX1Fy7HMWPqnSH8+i3cl+zfBCWZbS50S6T8LvvlEfTfX
	b3plsyvAj6zXsOCx4c6AQi0s6jAJBCVNfqcCI1rbHc/xAPI+l24S39Lt
X-Gm-Gg: AYBFou2i4SlG2yj9eQFlmDhdlG1YGXVsIUGrkfRNiDFsOp+vK6sJjF8IniGRyp8lCt5
	1r1ijga58k9Z4BzWyOtMWylq4+ZbSGNX0vCSPsscogLaGtNtySNwepOplnKgjbXJhuB6z3B4O2A
	Z8Jh63TJ4Ghz0I4P0UcggX+4Z4fqNZ43vyj3bfq4E1XQszAWh9gQRDNdYXGtK1KcyJOpTw5Io9H
	BSKc1qNv+0+WECtnqY6uDbiy/x6YFFxhuuEGl7N/oL/dZrdAMq6ffL6jxqxBojA6kxbqq4RYswe
	sD8c/NW0iruCHK6cw0xE8wHYRmgSCGjhV7DX7/EpznOtZTXoOUp6SiYhrxBVHoF0PfGhEO5ob45
	HgWgqiBi7QdjdVEDJh4eG6OX9UUwxZr/nzWWMXvIg7BGDaY6IjemWb6T5Pb6sdBk4A+MUY8o2Np
	LK097X2NQLjwU7Xmz9oGdAcfhk6FyPdLwtMo7rzdKRosplLbmH20lV7TGkAiytlSe9fx/e2TKly
	ridxI0UWuzCJbVF6n2LT8lC1QDINjX8KjGhns8=
X-Received: by 2002:a05:7300:b193:b0:339:7e66:5c9b with SMTP id 5a478bee46e88-34271d8cba9mr957272eec.23.1790363965982;
        Fri, 25 Sep 2026 12:19:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm7509986eec.0.2026.09.25.12.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:19:25 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:19:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
Message-ID: <arbIsdvRzPCqPXfs@google.com>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
 <20260907-stmfts5-v7-2-4a53381cd038@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-stmfts5-v7-2-4a53381cd038@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_121927_791703_445799C8 
X-CRM114-Status: GOOD (  11.91  )
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

Hi David,

On Mon, Sep 07, 2026 at 12:50:20PM +0200, David Heidelberg via B4 Relay wrote:
>          touchscreen@49 {
>              compatible = "st,stmfts";
>              reg = <0x49>;
> -            interrupt-parent = <&gpa1>;
> -            interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> -            touchscreen-size-x = <1599>;
> -            touchscreen-size-y = <2559>;
> +            interrupts-extended = <&gpa1 1 IRQ_TYPE_LEVEL_LOW>;
> +            touchscreen-size-x = <1600>;
> +            touchscreen-size-y = <2560>;

Krzysztof questioned this change. You need to explain why this is being
changed (and potentially split it into a separate patch as it does not
seem to be related to STMFT5 introduction).

>              touch-key-connected;
>              avdd-supply = <&ldo30_reg>;
>              vdd-supply = <&ldo31_reg>;
>              ledvdd-supply = <&ldo33_reg>;
>          };
>      };
> 

Thanks.

-- 
Dmitry

