Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE16D58D4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 14:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UZHmb0OeUd+8GPshNVOwzcpmIxly7Jn8Ce9CCCQHOg=; b=qM59g7rkuHZeNllXeTQCDUJKzT
	LgcTyJZbcJEbfaMxvk5k+UMPe2tbyd7nfvPrBgAs291JiN6JSPpwo5j/9ZGy3LkjBHgMOhvVu0Fqt
	A3Y5bzX4mLLAxBmRg945xMUGISc5/T2rkgulfom+oQBhIH6m92mkZVQOppomMmNO81t0fPuBdv/Os
	tgwUB1+rHDvjG/5NniZaVA6qRkeKtI5SKB+b/+LX30Abac3HTJo6C+GCQWCUKW8P52GpXlpqCqlUd
	4oYx5roD66/sZOuRE1sjwHbP0m2zAvik2Qk9fXblLUNaO4afU7JtVgyvoL1RAseKZgSFrFMTGH/Qg
	7njhZBEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZvu-00000008GgI-0ogY;
	Mon, 25 Nov 2024 14:19:22 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZuw-00000008GWJ-1AUX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 14:18:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so7871525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 06:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732544300; x=1733149100; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4UZHmb0OeUd+8GPshNVOwzcpmIxly7Jn8Ce9CCCQHOg=;
        b=rXsKc6O9lVSYVUJPXHjJvKEdgeXDA3BMmeLwKFur1nHUqLaFJ2osqrlKaZ5b50Hqs+
         VIw4L7fwDcqL99Ah64O1nEcP2rpCmC8437okpOaFiokX5Cec5rIkm7Vbt+vCQAsziHs3
         M9bxu8GhVavAWzMXEvfwqDuH9ehnDt5y2t5tEOZek8nmAuz8vdU5SAxpdfDyVCCFaYCP
         xXDB+tqNH04RoTJv7IqNEM6mUIk07OR/5JmuSIiIS0quXMrIq+I3XXIj4+h4Mrdr3zpg
         PCIqZd1c2Edp+EK9gAwp8Utsmog2PaGs+J2uAM9LT8Yia9FaaHwE6dcD2SkmsH974pRK
         UBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544300; x=1733149100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UZHmb0OeUd+8GPshNVOwzcpmIxly7Jn8Ce9CCCQHOg=;
        b=l5ScveU5MYZcSs4XZpUI+lgzj6+41QoUCUZOsbCXOgsqJf8bAYjW6RH3u5yIg/vbhG
         cHCGw3lfgSsCDdhRPIzkmBKq7wHHlevJQ9K8480QgXlx1ptuGZrNC2+djt0PGIcLTq4n
         z0IjYMUY82JA1JGMW6OBEip6kVnst5wDM4GikV5fWm0NTAlgm+x98UkO/rxIIUba0LOt
         4q1nPLc5g6uzVVpkUawwuAPb4Y7XwGOZzdD/T5eEaNsoOkQ5vZF5+O+Rx6oiD536se+q
         KEJNgKXdZaCDKImzJT0jRpRyDuimBUemwXG8Akgu7GVyIuqiWucjsksBlkV3x2l4zO96
         IJ/A==
X-Forwarded-Encrypted: i=1; AJvYcCVUNm5Dj9jVmUDv3TRblCwd5D2kjXOdRqXXD6vB7LAcbch2KAYjvqonmjHL/4/knWFPX5weIjjnXy7yu9vjWwNb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Ntk1qe2+Rycc32pjRth74WjIjmweK1laA7eZs85D1woR2pTv
	5nPY01ao0DpHW+UCRiPbwPtlOuRZ92K1u2pupUAvMJRIVDapX6/AKt9yLKsdbfk=
X-Gm-Gg: ASbGncsk1Y+Z05mtYjTxKSArYNp/g+gnzplZ3kbm+5PWCp8YSBDlhvFTif5iFEiKgj5
	4VYZj0sg1wOvHQODddRi+yCBDNIeXLD2Bk5gNyMy3mxGINyjjlS4YqbNqPiMbTs3GqoZ25t99qk
	VFNStQpJDSmc1SKFDOjQZ96pKtlfLrMUSG8s+5lbUArwRUNef0siVfS8EQxaRWploOr+o82LzJT
	VBuExe7X3d66RgsrXLHPm1r1oyMfH7oChwAOu6L4N46HHHMjvMenISWLp/d5jA=
X-Google-Smtp-Source: AGHT+IHqIIihdF3fumt0wugdqbgPyd4zHYslJ9WQYwGzPsEPSKNIXwv+JbkUTAaRMXwekVdAEkvLDQ==
X-Received: by 2002:a05:600c:548d:b0:433:c463:62dd with SMTP id 5b1f17b1804b1-433ce4e73camr111806745e9.27.1732544300035;
        Mon, 25 Nov 2024 06:18:20 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349fba472asm36556345e9.17.2024.11.25.06.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:18:19 -0800 (PST)
Message-ID: <0234971e-9029-4371-a0aa-7da835591351@linaro.org>
Date: Mon, 25 Nov 2024 14:18:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Rob Herring <robh@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241112173032.2740119-1-quic_vikramsa@quicinc.com>
 <20241112173032.2740119-2-quic_vikramsa@quicinc.com>
 <20241115165031.GA3344225-robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241115165031.GA3344225-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_061822_437822_6E6DEBC8 
X-CRM114-Status: UNSURE (   6.80  )
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

On 15/11/2024 16:50, Rob Herring wrote:
>> +  reg:
>> +    maxItems: 15
>> +
>> +  reg-names:
> reg and reg-names go after 'compatible'. See the documented ordering.

Rob, the documented ordering pertains to the dtsi and examples not to 
the yaml right ?

---
bod

