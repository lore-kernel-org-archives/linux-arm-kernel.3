Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45485C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfvUUTP3o9O2j15EPReGLnJgVKtQAvfjBsA4ztGbKes=; b=X88HjQBJCshrlDYUTZgq02MqN3
	ejm3QRcYEUS9F5S8Vt0EKOBHZJRhxnBdM6qo8r58dx4fiI8m0EY/ekjQKRTsu8+bTnUZ3Gwv531CM
	Fxg+oGRPadUGZv9a3e30OBEQeMcCvYXFo2Gp8jmJQjU0wybbnCt97b4YKQVK+WVI6vplTO7Z9c/xJ
	5eGoL6lR/lnKYgUT+29r3P0TgEAuZFbIPanZunUu4L/5JqBuvIHM+tCWZXuzyprrVReFLh3ELCVbR
	h9ndiSOKuso0qAu87YxWjhoauA/kMf6SYVzwC4eAxwVqikyrCuO4tNMVWls/1VIkWnPs08qGHlVJH
	AsanCTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPsP-0000000DUtA-2lkw;
	Fri, 21 Aug 2026 14:05:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPsN-0000000DUsi-3Fb7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:05:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so9804675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787321142; x=1787925942; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfvUUTP3o9O2j15EPReGLnJgVKtQAvfjBsA4ztGbKes=;
        b=mAuhojT9nh/7DX0bHjJmPx5dBOeHbw9OlyH6Iskdn9azdh4pFw2fTXZ6kGdHtPjWZg
         ovhcT/gLtY5g778P25QJzBbRDjrrOqr2EZeOa/VqsB9msPMHCeF9lG1cC5w3Ygh0uoaV
         CCS89BWhs6/ZvLrCaMNsT2TFoLBhc5qCmKAFUfzBELQOdZ9CPYIweLHFPFN37h2JqAmw
         +5CeKxLV2IdEXTbrSKhAwiepRcrQz2P63FhbWUQLcSrGJkD9pgahKFC3x+bfOBv2mcor
         WGVQ4Ne7TbDtOSYIp9vOjb7xm6uYN21kRGPASxo+nOHrAdpQLIrUlm7c0nSihG+pIpXL
         T6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321142; x=1787925942;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfvUUTP3o9O2j15EPReGLnJgVKtQAvfjBsA4ztGbKes=;
        b=jdQLfUpdfAq9N5pkgJM9B4lUcIDQi7y8zJGKXbHgDhQBzSla9eLpmqr0By3j8bSjEU
         YcCrReteSaxQHueS0v3mn/+K74zNdyh1AdqZtLVcSbbGZcVMvlAklZS1MaGDTx2HOuFS
         HRkkfW2LMwdXjlBf4cOUSn0vh3+HYyQ86xyTaZWOV1awWMuRYpT7Q67SaDKLlpQctUTn
         TYD7J76NBbAx3wc30jMAgIfXykaVFTl+s73p9668dTVCcvqN5+XqhAn9yhWNiMksA/Oh
         DrC603KWm36Q4UGKGXMFIYqZ87uryziqCqVtabnI+IYg0k894Bf2lmVmuAPR4LB5ClJF
         hupw==
X-Forwarded-Encrypted: i=1; AHgh+RqYNdZcijrrrFboPISy5Ku2Verdi1c2XMCHl/I6LTggrcBiTYCC16n7d3TlOe5B4WQFZBA007d/5Grem3RuGx15@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8GWjz+h0IWIpo5MCLvsoZeyd30FOk9DEkod7J5CXt5G6QT3NW
	6kZG5mzYi/BbMgplB21X9fxvTELskNi3o4e7HUdTokESg8jj0//uF7db
X-Gm-Gg: AR+sD130UlRDtrnLAhlWwmXnbt4AyYAzbc1xqrbNXBUt+3g1kP7LhovaYBFsYuYL6X6
	/UiXYgedH5y8UGKR5QLNmzeQprWk0juSiRMv9Zv+TCBX/uKJCq0BtxRJid+wRVClL+dyQps+XY8
	F2Blmxt8EJc5NX34DgFzJCZsrUOFfjRIMt2wiIAcc2lQ11+L+Pf+rfk9r/9ukteuqDNQ0VlangP
	J9ujj2QDdwNazIqKgtXd9dDerpe2bzFbLpfwKTnMn7+MRIhP2IRvTArnCXTRx05cd9EPwoVFY9q
	LcFYWaOtLESgGezfr5yftVrYVHyLXqEStRs2naGxIZNGoWfRMQIu9+Mn6O4C38l4JgVPdTGTBMn
	eJrA450saRLeRWOfms/fvzrzKXELsyjGouhNb6Lgwm5b3airAy/fqmmEdnUAbxNFyTc/DySC8gf
	zhFf49205hXclaixE0wnJtwinfRbprQZ+LPJ4Yzp04omYen4yrX+6vTr4MoHLvTwbc0ku4P3ItU
	UXZzui444GkPvU=
X-Received: by 2002:a05:600c:46d1:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-499b8469f20mr84781845e9.15.1787321141718;
        Fri, 21 Aug 2026 07:05:41 -0700 (PDT)
Received: from [10.45.28.226] ([15.248.3.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9049f84sm29305385e9.0.2026.08.21.07.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 07:05:41 -0700 (PDT)
Message-ID: <986b9e8f-f136-41af-9ded-8bece569c0c0@gmail.com>
Date: Fri, 21 Aug 2026 15:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: Add pre_fault_memory implementation
To: Alexandru Elisei <alexandru.elisei@arm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, corbet@lwn.net, vladimir.murzin@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
 <20260612162354.73378-3-jackabt.amazon@gmail.com> <alEXtW7w-rqlNG09@raptor>
 <yq5acxvz4u1i.fsf@kernel.org> <antH38FPSmAZ0nrB@raptor>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <antH38FPSmAZ0nrB@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_070543_823827_9105236A 
X-CRM114-Status: GOOD (  10.67  )
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

Hi Aneesh and Alex

On 11/08/2026 5:03 pm, Alexandru Elisei wrote:
> On Mon, Aug 03, 2026 at 11:36:33AM +0530, Aneesh Kumar K.V wrote:
>> But both gmem_abort() and user_mem_abort() handle -EAGAIN internally, don't they?
> 
> I think you're right, please ignore my comment about an existing mapping with
> is_protected_kvm_enabled().


Thanks Aneesh, yeah that's the intent. Vincent pointed me to the
pgt->pkvm_mappings interval tree that can be used to detect the existing
mappings in pKVM, so I'll be updating to use that in v6.

-- 
Thanks,
Jack

