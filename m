Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC62CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyyBv7XiGB0A9ajOq2ClS027aqw2mhgkT4I+6YXU7S4=; b=Q5QD4TD6xUD9biBAB8jDdzgi4s
	MNw1hqShPPqSSqvhIahARBrPGbqomdmXVa3SVWN/SJePM5t8k6MEbQJydAVC/8CRBKwz4tlnKhEec
	kbb5kT53huFq+5F0qaylHRNw9jbSNRFNSbwb6c3K4FYG9Y6tvAdd3/iFY8uAgFUVloY18YnmRTB54
	S8lj1MO/EADXdLLH2A5SAaiz8DBuhf7TdbLYw6ORw7Ogd3YhZlEoDlaNq7jvlL7N9rIPmjCRBqGZz
	+3CMf2GbQx5ufj9S+mI1UXjZ/YFWaUKdy3e3fih+iIwwHI+mIdkaOa+fSWoOR9SHNCl+8a2giYfjT
	oLfi3jLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZh5-00000004rkM-3dfB;
	Thu, 30 Oct 2025 20:56:27 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZh2-00000004rjb-1Pz9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 20:56:25 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7a28226dd13so1469468b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761857783; x=1762462583; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FyyBv7XiGB0A9ajOq2ClS027aqw2mhgkT4I+6YXU7S4=;
        b=AOWIIJTQ/YaGnpb2Xmi1bVd0jnV78U0oUXIxGleTqSaKeoQyY+CEsiMp+tfNyP8+wj
         0EtEj0N4+b05vTaTPGyVPq0RcgJxjgMcZPEpFQ1/nQJoQDKeXqIqaO1WVWidHuReC99n
         JCKoT1ZhmUywxaRxMLEXNFU2yWVazW4MFxn/cH+iTeAN7C81IAXFCcZWBNQCR+UH+8xx
         +Ik8kh/Vhpzm8jQ8r/RzQPOgdpWE18xFB1mMRF9PzHxyQ2olZT3C6nIRVT57bNBjxuzm
         btRBvIRhPlJfTypuBzTTTouQDZ84YK7GxKfrzkJdaJi0H9d9RvLr8KgYlaPwm9DeI6dt
         yqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761857783; x=1762462583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyyBv7XiGB0A9ajOq2ClS027aqw2mhgkT4I+6YXU7S4=;
        b=A9eBhi894PVQGuuM6Z4JLYlJILfOELeJZ5a/+psgz2pDlrdNPobjWE1G33uwrEZVtw
         cjN/0sFiL04qXvWUSna/OabM1ycBqCAXCr0BP8RKUC3ZmvCphvx8dXYemuw7wxTeTj+q
         uicg/BYbMLphOFWwRjmvLIMAlJIHvBUzDtf/PeFFTW+CKBOGPRcZGYTJ2r6qki3LkdtH
         YBXMZ1m2mzPk45tT8oOBB6YONHbXtGLOQRJOrv2I1BKqLs6JuInHNKSM0STl7/zLfe4n
         VlxjaDSNsUZ2NBaTEPH0UCIDg2wMzTUrKixW2i6Qc73sXi4xmrNkkLzJI3fPrKB4ikDA
         Q59w==
X-Forwarded-Encrypted: i=1; AJvYcCXXFKTU1TdNtCALVCCGBMBiefazvZKRcb/ticeRQxzCh9YHU0Jf/8Xy6k3FqjaA84x7a7/EN7Mx+z13xvN+pPPy@lists.infradead.org
X-Gm-Message-State: AOJu0YwGl+keuSy5BPdLZTYfhUjmzrLSULvFg6HjOwMXJa9GFn1eH3cQ
	CR466qMRyId6lfXvKWWq4cPZiVmjSKLsDZmVwodxneGlSSgSXtFM6lOk
X-Gm-Gg: ASbGnctAHTMiZ9ApIZ8TByhyBTgnnjcNxic4OcHppwnz/644uojliwyh6h5/Rd1licK
	moZrX33VQmjwLze/exa/wLv9usMW/xyzL57XDEuGKS+kfiBt6FpGDDI88sodeWjhPDozfUl7AkW
	mCgYUNxdfASyE8g0neUygZqeU/h0TEGZ4idaxQ7zOl/f64x4fA3MCJCm+T/0uM9xYnQNLmCuDN8
	R7PGuGIRQFHhVqeS/bOqehSaFH3gGzX4fG53V6P3Qxah97Wt20/OTXDpQjmqVdF3evlnyxhbYUp
	awqBdO5HCqLD+aNHKhgHimPtOZASbEIj021xdlfOFP3ZL8SKFUqRSCipDeGV43V1jQs+cMTVnHF
	gUCMtuhOps874zL01PsmWgP5W4tZ/KZvoG4w5PvnqH3S8Wj+QiQPV8EtGDO52rHWht0JqljdNY6
	4TuvCdHBRZtlaLzJDyAqtJIsRYDUUkahyiV0qd80y+h1p2HAJF
X-Google-Smtp-Source: AGHT+IGNmTbOXun2+o+j20VEBL3MHIqUqnzHFtK5+3NODUKJ3fvksSh61+6iQ3JoqxN1WGI28rXt1A==
X-Received: by 2002:a05:6a21:6da6:b0:341:dbfc:c73e with SMTP id adf61e73a8af0-348cb9a0bf4mr1506363637.31.1761857783191;
        Thu, 30 Oct 2025 13:56:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bde68sm17870156a12.1.2025.10.30.13.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 13:56:22 -0700 (PDT)
Message-ID: <df55123a-80f4-4c02-bcc0-084e01a94228@roeck-us.net>
Date: Thu, 30 Oct 2025 13:56:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible
 for MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_135624_399905_66E9BE6F 
X-CRM114-Status: UNSURE (   9.02  )
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

On 10/30/25 00:40, Louis-Alexis Eyraud wrote:
> Add compatible string for the watchdog block on MT8189 SoC, which is
> compatible with the one used on MT6589.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


