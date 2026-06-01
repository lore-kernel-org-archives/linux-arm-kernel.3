Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA4FCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaUY+wznT6I0Vd1tbKHFAPphi09g/5Uz9b/r1spWPtc=; b=FOWC69Ceb/Sss/rHykk62LB2ls
	BhUXYlu8O6woPwW4wdU7TEhilRL53Cum8JN/CIlryPncdgxh8qk94nKn2MdqnXCVWrs0NQ1CfxWb+
	zgEi1I3RmgG93hzvzhuWbbfNQ6how8I9wZCwI79poZplRTGJGLrCcay/1b9RLXB3nX7BeAARIZ6SI
	FRyr9trbHg6TPuKSXhKR8AuzC1TfOHdxZANcEqdWlRXMGpg+f4ZCDJZEglHT/d8HGwxvs56N4E5C+
	d+rCbyevLD0Sf06STK5LjC3iFBo3IvyLLLa8GygRqDJJP4grDeNA1LZwoXPYtc1jNe8FiyTn1BNcP
	9/TpfxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3QZ-0000000BG3m-48qF;
	Mon, 01 Jun 2026 14:15:39 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3QX-0000000BG3D-0zHS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:15:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45ee1a56328so4780925f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780323335; x=1780928135; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vaUY+wznT6I0Vd1tbKHFAPphi09g/5Uz9b/r1spWPtc=;
        b=TPOTcGatfvPVTkCndLtAg0JK2Rtzny6XelcDXZITAIqGX+bY8wMDmO4EvJ2gPKpYMV
         dRweBMKhFV0JoNBKvJbHC/8hIVtSZ4va1ZSojThJ8z066wUBV4iVc45qNDo8EitLdj82
         IcDkv3oSr4RF/h7gb069uP/DtHnwVw8CHoZXYgItgNTH+5AsBAhy+C6tBwnRLkqlavfL
         zQP11PNwVKBkRCg72LjDWOfMIQjbV1uhaPFzvXU1Zs2E3D4qWjB1/fxh0kvsT3trMTCy
         mooPv9ABHVWNk4CQNRAqIHxd+Tvw0lUvBjdgx7Rv5ZantT/Zwjl93qSi0pt7yBQhzhmf
         fJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323335; x=1780928135;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaUY+wznT6I0Vd1tbKHFAPphi09g/5Uz9b/r1spWPtc=;
        b=E4s+3CByhThzckfwuUF4t59+roODIWVfll+WKBPiCQLP3onsayNJTBLW6cWmgDr/M/
         4BEZWvJWUZn0wDq5Cxake/gVaTmIBYEW5VRuTB/YA3VBx/xgkidKDjbnIuvwXmpzRdpA
         hFQvxdyrRMjPmGcVjaMFp4iZAxIH4eKNh8pmVs9iN9PmNMTBWhimFpsUeeaLZO0QAk3u
         89aXe2SHjimgRqEEdfVZpFoy/vGY+G+7bkim/7dr1A0g3BPgKOUteAE6yPMU5lUGLPAm
         w+sSQZzMLhzZDesKgJvPn+kA2CCb/jT2zr0GLe7tk42DF8zwASRJsIY8Skgzh4chNac3
         WR4g==
X-Forwarded-Encrypted: i=1; AFNElJ9/AwM7fAFMH0S7njkGBSPmvzeJq6gA1Y4pyGuDIx0AYdheurukDqQHhkJMdPFVeB7DVQAcKDJcSu9ADXvGHB3T@lists.infradead.org
X-Gm-Message-State: AOJu0YxbfoglN9NGXt7xLbNQWySy7IzEUYk/HVh+LUWlWZJmGCfCPe9A
	2vn1uQfcFAScyulj8Cc+HAC8SAU2w1IGGYUK+kGSFM+6le0tkQEGgZNLSEuy7uTvGSw=
X-Gm-Gg: Acq92OEsgtuIDaRS53YRy5nFZ7/n1/tSQgxgNym9h2dNJIfgTMUxvsfxxnI8iCgbNTI
	TFgBsJrjywZfIgo14cPB92wAf4AKra7gcCc7Q3rNh7w4zH4V9l/pd8gbM5mCmWEpNadKvaAkpPP
	CYnEx/466ZH3LemIxT24O9S12Vlo0ugj2Ub3vgLLdetAKRvPc5kze9EUC3mucfLSJNqiJ3Y2GG6
	HeuzWetXcVo0JnNPn9AQf3kqJf9ZyB1E2Mvw0P8ojh2nNki3Nn4sRHgYSJrUG8kfx5NSEO0J2Zx
	VzUd/dCvn6hedgVBzg9NsNWKq7mff9T428fBxJHQprwTJmbuyqnWX4TJk/4tW5MX37guP0IbFyF
	Bb0ijbMNGmekp0OYcqdQ2HHcRXc6CGywYAZirrM7jYzRYR1y8JOMNVV8erXxUo/ZGuss0Jp2029
	bqm6S+kxlyGysxjlbrtA58nR+vJwp3NVlYnPevHQm1p7vbLo35tAL2ZCFZ
X-Received: by 2002:a05:6000:4610:b0:43d:50c:6f33 with SMTP id ffacd0b85a97d-45ef6b670e1mr21405913f8f.26.1780323334783;
        Mon, 01 Jun 2026 07:15:34 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b47eesm27847640f8f.9.2026.06.01.07.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:15:33 -0700 (PDT)
Message-ID: <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
Date: Mon, 1 Jun 2026 15:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org
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
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
 <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_071537_293524_93051455 
X-CRM114-Status: GOOD (  14.73  )
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

On 01/06/2026 07:42, Nihal Kumar Gupta wrote:
> Here is the full IOMMU SID list for both platforms:
> Agatti (QCM2290):
> - 0x0400 0x00 — VFE non-protected
> - 0x0800 0x00 — CDM non-protected
> - 0x0820 0x00 — OPE read non-protected
> - 0x0840 0x00 — OPE write non-protected
> 
> Shikra:
> - 0x0400 0x00 — VFE non-protected
> - 0x0600 0x00 — CDM non-protected
> - 0x0620 0x00 — OPE read non-protected
> - 0x0640 0x00 — OPE write non-protected

What this tells me is that the Agatti binding is incorrect for addition 
of OPE as a separate device.

> Only VFE SID (0x0400) is shared between the two platforms.

Both platforms have the same IOMMU list, its just that you are 
correcting a bug in Agatti's defintion.

Again only IFE SIDs should be included in CAMSS...

> The current Shikra submission enumerates only the VFE SID.

Great, this is what we want.

I think for future submissions we need to be commenting, naming, 
something each IOMMU entry as we have a problem now in Agatti and a 
legacy problem - already - in VIDC as a result of misallocated IOMMU 
entries.
> Should CDM and OPE each get a separate YAML binding like [1], or
> should both be part of the CAMSS YAML binding? If part of CAMSS,
> please confirm and we will add their SIDs in the DTS in the next revision.
> [1]https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9- 
> bb1055274603@oss.qualcomm.com/

Yes I think CDM should be a standalone block and BTW use standard DMA 
APIs with its own IOMMU entry.

Similarly so OPE.

The CAMSS node should only contain the IFE SIDs.

So, actually I think your IOMMU defintion is correct but Agatti is not.

Sigh.

---
bod

