Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B53CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YJ6W0UJoQmAwaQGvuK/o3SKo9denIg2VA3bJEyyrOY=; b=AZccdQTUH++2nuQGRaEodpn6gx
	lgweYaOqF1D51bVe7aqxQroniOtQbnXSUbLXitz97BLNZyJ2ATLfTFMsoy9o049yQZehtZlEbvP3D
	RM6OtmugxH8ufGpB95DW1eBp2h+ff9FYBGV4X5hTmkqm3OPQypjtUkZeh/CYfb0B7iJ9ZfAcgaYFO
	0F7+1WpTVNQS/n6ahkC4kToAssewed9e0++kV60fhJNUCX3YhYlX4Nli5A2MaRX0IWddk8FlCu5WG
	kSOm0wRPMKvuFC7OKn0FeE/Z/4Kmvd0WWaydlYb2RongRd+4ghfSTV/CInbN7EziHxUqdeQldVLpb
	nLQRGHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwiJ-0000000AW13-0kWe;
	Fri, 12 Jun 2026 07:54:03 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwiG-0000000AVyt-2xgT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 07:54:01 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3967701fc3cso328921fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 00:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781250838; x=1781855638; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YJ6W0UJoQmAwaQGvuK/o3SKo9denIg2VA3bJEyyrOY=;
        b=t2PRsTiIjqSw1sB8QzfYFAo0omV9MmVCQKrDrTmh4u2scek5mRnBov+uCyyp+Ds5kD
         qm49g6U21F73ikVeELmufARf/cXidSxVxABLuz0ToxxPqAq0cWGArc8YewjRJ8gWYzYZ
         IFtn8woYkWxmJ3nMjMV4Gw6Z9mgEdnKs4uw7TLQhd+5S1uz74hmqGMeu98r2bkBTDVux
         csx6W9hvXByvNCNRhxWKerWO44MjQEe2zDeGim8JIsUJTF64MAiCdPwkTxjP9uwkB0nu
         Ho6s6QEctOsVkvNAuv4kCfcGGAF9JyfxL5kcKe/OzmZmHbWUmO4lH+j/Xez3Bnk9YnV6
         pgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250838; x=1781855638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YJ6W0UJoQmAwaQGvuK/o3SKo9denIg2VA3bJEyyrOY=;
        b=e8ZvTIeTKz1kmpBUn2yhvl9nj79o+0q+JrLAIqTJvA+JuQ7lZkPpsXMeuFxWcmStIE
         5rg8vXBDLbeJ4kLcmoLuqhCXz1rG1yNgttE4Hozd7tSscnIc9Qbiq+lGqG+h/lip0Tk/
         1XOTviI/hl5Fl96/idzTppI9/tyuvchc0SqAQ8o32y9XWBJi6xBgDzYZBICaSEPSOVSP
         uj/+LFpnMhBJ86972C9LUOmfGvduKhmXxLXnfBpjJcKzKKYNs/eFdP/fOaIjVP4H1Epj
         gB8Kpl4BChSfu7H2cMdCye0q5XLfH7OnSU7R4EqX5sgIBr3W/VeGEPinWwQX0MGwoIf/
         9suQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Gbanw8CV/LgAWvoL528k5xSKRHucBUGcN/+dIh8IkIGPsF6bOEplEmn1cJ37Qptqt0uWh6O2tZ2GPkr95+8nX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8T2yVkBXjLNvvV0+s7cRZjmRZvD3qJnbUgERS1zjxRfS5ZIDw
	gtn8QCRp54rhesrsknrXua2S6VMVE7jstB9hFHN8f/5nniU+tsU7EYcfDp+fF7Fjtyc=
X-Gm-Gg: Acq92OFeQqVHDhGwMb7Q9loZ169e5/eGwiQZ/LzssL+DS/V+qsIq9ZwTUkewS/ewFme
	4n69E3/dpSS7GTM8Lgf1jSzvrkWe0/RTGJOOPDTPM8Br1e8m4xjNaD10AV1R2OShN9tEh4zGMf8
	Bo5Vb/CkSNCKpUPsbgYw/jkpr1UNtvjQUy6PQDdIeqBRFPcYw1VNDniW8iK1oWAzsZjf2GOZ4Hb
	H6aobRUhhN11xB9tgIHWf+giHAfh1riQXq0lfEX5ojt8++TOUsdnJXjYUWibxOVmfFf+mQVK1qD
	YS8asIIhHNKU6QM2U5ay7iY2bCIKNkXX8n4sFUHZUTz2Xg6iQ1H+ch9k6ssjEWAvCc7k4VSCvmm
	LagLgTdxPCbhCvFdllVxhsKC1OL8+qrOzFqv7hZKL5c31zF8oL3IMI2I7aHEyGmgftbfBwBhpdt
	ATKGX1vI3E7gpO9oGVL9NYbm15sUnkkYwB9A5/wkNqZaeLuJ04c1su+cEfxMQQt1Vxm4CiUmsEx
	zyOFQ==
X-Received: by 2002:a05:6512:b91:b0:5aa:6fc5:642c with SMTP id 2adb3069b0e04-5ad2db715f8mr228537e87.3.1781250838480;
        Fri, 12 Jun 2026 00:53:58 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b4516sm308890e87.72.2026.06.12.00.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:53:57 -0700 (PDT)
Message-ID: <ad62d09d-ea06-4b65-937b-6dc49581bebb@linaro.org>
Date: Fri, 12 Jun 2026 10:53:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: i2c: qcom-cci: Document Shikra
 compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005400_764124_B508BC74 
X-CRM114-Status: UNSURE (   6.51  )
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

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Add Shikra compatible consistent with CAMSS CCI interfaces.
> It requires only two clocks.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

