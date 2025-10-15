Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7893CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hy7Sxq2jeauDwIsq3RFiUz3/9uTUpwLAUFOHgM+Hwug=; b=EM91Cn3wzxDSDl7UaiYima9Xsr
	1TDJzCnSCpsLNaVde5q+uDtxAlpd0ocyR2YxVisx+IKHM2FDjQZPQGz2cDFdGCZjZ1YkIAOfdXyLP
	x9QLfQ/E6L2EymlgVFwJu1dwPfuDuEnxDH4m/qN0oXoM27S0+u3zDgCsKhK9HJvqtWY1TjOoSNxpz
	BDWgl1pRizv0+AbtrsueRm2gIjUKr50qcvgUpTSyFUeBV0hw5e2ukvXwz5kLmzRjlnV/AglQ85ai8
	7dUCyytJe9g/2fZ1r8n81xIZJTO3nO7Kuqi3fqPiAIKh/pGxehXa9FmT3dZaK5fSPx0tz+IbRavMP
	s9UcU1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91lo-00000001jTQ-1R00;
	Wed, 15 Oct 2025 13:42:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91lk-00000001jQt-20xf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 13:42:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so40137725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760535738; x=1761140538; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hy7Sxq2jeauDwIsq3RFiUz3/9uTUpwLAUFOHgM+Hwug=;
        b=rkcyXI3klz07lVvAD3WsP9aEZrV+fNpMa/Rox39xCdkV1nx7jjt1mRp1IIVtZ5dYHM
         anpBYBiwFaIP5zFtxe8cjdVLYvE7MYlrTFncg4/Dt3FgYRV4lRUic0BsPHoTmGDCNp31
         inR16BymWNkCM29a6CMLrAwcKJNeCj1/mV3lVy16GacvZMQhfQ70Wtvz2hUqhOtMxCF/
         NImsbzvEFxcGPZAI8X/wseK1nOoL2j1CLTv89n1ZIDrtw9ZnW+o6TLXJJCJ60wbXN4Ti
         wecUgqMmmQlvahCFfnJ1xmfyFbryBJ9yM5S1g9dzhj5mYDMG/4vkR3BmrLrhsRX9Wxh0
         I0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760535738; x=1761140538;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy7Sxq2jeauDwIsq3RFiUz3/9uTUpwLAUFOHgM+Hwug=;
        b=ti/IwxbKqG4PStXsuZvBq+qlgxBfBmNGZlutfWZ7kMJgpwYBwOiU6zvTKUygiuXvbV
         Le+/NSl0k7w28AEKVSGTlX79o3iwBFEBIEaLQnN5v1OmHUr1Fxdnk/e/bs/1HMICUjWW
         o5mJt3BZceDdU2Xa+2HKr3Cg5F02KsCYIFdrV8qdkPyLCyg4yriZk5jNHjurn/zerVPt
         jloeD5nCs3ppA0etZtNSW20HDW1Yguzo1UWZUxyGlenGBH7RDhPD7qJ0dwbJb1Rt6Be/
         k4F8sCjWqvWZ0EXcxKZDgrqovO16JzflAMcVAwm4ESaypcZwV9vchzP1eDCMQyalh6qj
         skaw==
X-Gm-Message-State: AOJu0YwuQYQHP0Lw8otfyFxBGIDwlft6Rm40xut0YIelQr/7G+HbUxkt
	NJsh7uE/Bo2VquRBJ221CEjR5N7vWejRSNporiwwIhPJAHs433Pa3dkALfChVrv/QdQ=
X-Gm-Gg: ASbGnct7jTofqKOnA0rv8+0+a/HmTl+JohIu8gVuLzx80owoEGi+36BGrNLPlcxvxZK
	lTA9oc8dATjPMcaRZVE2LnuonHfdsfvAHAs1bKd3eeFmpzNDtkjRTxaScT+6oIh4kWAmZqn+ccd
	TFXSvD/iyTQeNwXNHADVxUzIDGIl/2cPgbfdRIOSHdhFUU6ODldqHcnsfwXyK/3QW2X9GRvrULD
	0Ty2ukxDwNcYcG9gh/PwwYqtIHQ/Cyv/2vVWgbFMFl6XNHg6jx2jXfIqeRmQZp2oOFnfXoXobq4
	8TeVL1SnOyowa+om6kJBHddQ3vC5hWstfFU9qvj7SZ4a7HckjCLlG9o1iklFX0zDLNlq+thsxyN
	wRDAsJY6jKI+xJal4V5OqKqjRzBCIac9b0MM6BgqkNy6zwDhhZDbwSYUbBpY9qIvJDNGuZlxOWF
	Rp/4WJy4b1+Ls=
X-Google-Smtp-Source: AGHT+IGNyrbP28TPNxoPwZO9FwODuDXd4rA8MhI1zvCQw4TzwS02DCNbsFRGuJzAypYvXf9n3XAkEA==
X-Received: by 2002:a05:600c:34c2:b0:46e:21c8:ad37 with SMTP id 5b1f17b1804b1-46fa9b06d3dmr193578825e9.25.1760535738467;
        Wed, 15 Oct 2025 06:42:18 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583335sm28846561f8f.18.2025.10.15.06.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 06:42:18 -0700 (PDT)
Message-ID: <84f17b74-a3ea-46bd-a6d4-efa79c1cb43a@linaro.org>
Date: Wed, 15 Oct 2025 14:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 quic_nihalkum@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_064220_555224_183127E6 
X-CRM114-Status: UNSURE (   8.09  )
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

On 15/10/2025 14:13, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Qualcomm QCS8300 SoC contains 3 Camera Control Interface (CCI). Compared
> to lemans, the key difference is in SDA/SCL GPIO assignments and number
> of CCIs.

Codename should be "Lemans" and since you need to update the commit log 
for this it should be "three Camera Control .."

Assuming thats fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

