Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60E4CD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GU2T/pZfXae23cHrpeloETVxMMttaLJWiMdOf7oLCD8=; b=ASQwI7EG2+wNrdHsnx2xzRHAaY
	G/bSxCaq2JTrQyPJILpLQxFXk3yMWY1E795of42vGlsP6RJOJlK7zEpr5beu7VLCeebnhBERH96a6
	AGvbEW2s2mMHiBvkX5J0qYVL23WtRMWl+VbGThfXVZvEMBHZAMkVIjT/8Atdhko/hx7y272U20prL
	gnL2LBMq8deMeZ2/wjDlZ8HSWLBGnLlGwpRlDbJjYhxGeNCZubLudJWxqUIYoNr5kHtoVOsJXGLVe
	6p1TBYdGHeiXH8Kvj+5aXs7dyVpy2duzjCm+L3AbEk460JYkCdYkL+KjNBvjrBqXgmz8BQ4xJ/kJz
	ZCL+q/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyfH-00000007aqw-1lqp;
	Fri, 29 May 2026 14:58:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyfE-00000007aq9-28nk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:58:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so82983525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780066698; x=1780671498; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GU2T/pZfXae23cHrpeloETVxMMttaLJWiMdOf7oLCD8=;
        b=lVoDKvVF8R3/0I6b8WjG0nlxqrkU5nhLlIHM16UlFst+Plq8kvneeBE5xlXmlJv7tg
         i00qCiOWPKcHbsdRPFsKLWAtsix9f4kmP3NhVWq4MwLAEo+jO0zbJIXaFqD6WlbPw1yg
         hEwWXu4801w/s6Nx3NRVPzAiUrVz5psWqK1RoehQkyM9y2HF3exZ6a8ldVdNjMb4PqEb
         zup966JkEtVarJST3/99QQnJxPykA3/jQJtaIiRLBGHIEPLqoxdQJujGp8LpMYfGNC8c
         J/ePe1MW7Tav/a3XGtrwk/HP+UWzJPGsPgrvt1TbqMvB2CqBUYMam/lta0Lz9NmtGkN9
         Vk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066698; x=1780671498;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU2T/pZfXae23cHrpeloETVxMMttaLJWiMdOf7oLCD8=;
        b=GlF0nfu8KcN0kqwXxdrnD0rrpyV9b2VTMwBtZOfzKWh8LaHYFM8BRaumq6uu91EyWF
         LFVWroW4HZP1732P7Xin6QDcTbq4ZpNIhpOXLeWYk28s2Y66ohM2AomtTAJ568sdiClo
         1YP80NKY8uloPmrG+PDQBETklKlrLsj6jVCgPsD2BBWumWWUzEdQlcN6FUwUDBEQ0b8C
         hGDvADQuNDdKYNALZ2zzssh+1bfjuEX10gE/U2tS/C+91eS5RLJpJcLjz2OUYHP72A0S
         nAz3dTjFH+qFHa3hvuc07r3hrIHm5dT/IBMPBTNYac6TT0WlKMYgf+TzqO+JQumdfXCw
         n+qA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ak6XpICzquAT5IV34nK3HK0P/FYlGVfnIDp+NSPa9Y5g5lZveLb7/Lgjkn+gt4/F8LBV8u8ceD8mr7hFftCLC@lists.infradead.org
X-Gm-Message-State: AOJu0YygIvBSgqYKpG8tEjC0Fi99Pdyo51YH1LnGvEZetUacqzmt5MAW
	0GxyOwAXuJUgij8yWn03pMrIzVxvAuFpV79EAes6YtwAo/nnTJ6bTyTh2YdbfB4WTH4=
X-Gm-Gg: Acq92OHabAq2hPWAbPaqszR20FHB4uB9R/0GgOFdTWjwsMs5J7Q+lMFAck3jx9mgpmi
	IJ7bq0a/kmrLb4r+4xVE94txdI0zhB5l8C5GELEn4S+aQqivIHbj+CXXa3m5JtgJU8Vk30VFcwU
	tCceGT+cUwQgbg1wnjbTGciXJRlJzlzGaXulVtHHjDtCcqKrrjN8rB7HFwRiEDliZNXLJU/JwYq
	2rW2bSN5Y0PQhOWrK1jh8v173UVqzEmWYqalhiZlUuw2Pc32tHCQxnKpsfPd+35Wjh6PGn4rZV+
	70X064cnoqCn0JS8JZZC6yuMS+dPqPIShFV0IpMvoAfUh8Zlg6G+PidUk1XDe2LA7Ubk5Csq8S7
	GNGTLgqAKal5a20RoGR+7TEXL9AwfP31Sc3VsTvqUUL/DHmpQNLMfFQMqEPCepCROWStPZSzxqO
	AlMWwX91W3OpEu/dAH4RItFHOL0tYJFxqOjOBeu2Rf4Xs=
X-Received: by 2002:a05:600c:1994:b0:490:48df:2793 with SMTP id 5b1f17b1804b1-4909c0e77d6mr57620855e9.26.1780066698120;
        Fri, 29 May 2026 07:58:18 -0700 (PDT)
Received: from [192.168.0.101] ([64.43.33.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909ca6e124sm49445275e9.7.2026.05.29.07.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:58:17 -0700 (PDT)
Message-ID: <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
Date: Fri, 29 May 2026 15:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_075820_593624_919CF0E8 
X-CRM114-Status: GOOD (  11.26  )
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

On 29/05/2026 15:52, Vikram Sharma wrote:
> Shikra and Agatti are not iommu compatible in terms of Stream ID. Only VFE SID is same
> for both. Agatti is documenting iommu for VFE, CDM and OPE. OPE is not yet enabled for
> Shikra and in my opinion it should be added as a separate yaml similar to Agatti.
> "https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9- 
> bb1055274603@oss.qualcomm.com/"
> 
> Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.

Which will be a problem as soon as CDM is attempted to be enabled and 
yaml changes are dropped upstream.

Hmm then it seems to me that five is too many for Agatti's IOMMU set.

I'd like a number list so that we are discussing facts instead of 
nebulous hypotheticals.

For both Agatti and Shikra.

---
bod

