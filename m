Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F7DC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 00:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aADQWG87fq6XITbxBIYillliqdnDSadEcTkAR2o/L7Q=; b=tIPHjYscTux5J+BpGLvFfL/Ly/
	NjjDeHngcPx74W3Nf3aUdSaY+h8D8biARleMqRaKwJPMXf7P3mxnBEh4V0W6I4Gr7yunqajzEAQYH
	vkp9STr/zcA7Ulf+Kxbd+jLMnuGdHW0Lc7vFwJwL47nuPMav+8sYoRm1a1+jOyIlvnw5Ry98mjrpO
	xi6OhIp9WOwO+psYiphs6oRXgeMlCoZT3JxkoA7V1YDRIdkD4/rSprGsRBd9b9b63KHVr6kDDMrs5
	+dKDoSlvjsnL9uUGTebt/uWVrl0oHQCmTu9JVm1j8oeZI9OmWXPwiUfEKWD0V71BfWZI9kBJMrTFu
	lIB1Jk1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnFx-0000000DU6M-0GjF;
	Wed, 15 Jul 2026 00:13:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnFu-0000000DU51-0H25
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 00:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784074419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aADQWG87fq6XITbxBIYillliqdnDSadEcTkAR2o/L7Q=;
	b=hjeO4YTGKTf5UnBFkbukJSlnns4YB9f5iJS1J/FDP3h1XXtd1NhLUFw8bId63z8hfw38wX
	AO+0AZYGqYl/RPcXjkLO1GqHZDXL0u2x0M2jv28S0rS3yB/AlWEZ5dnUmjAqRwVuix/TnK
	xgYvX21dei4S/ngHccRtCr7uLYhYvHY=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-R7NxXwkaPAGEqtE2sg8-xA-1; Tue, 14 Jul 2026 20:13:38 -0400
X-MC-Unique: R7NxXwkaPAGEqtE2sg8-xA-1
X-Mimecast-MFC-AGG-ID: R7NxXwkaPAGEqtE2sg8-xA_1784074417
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so7134641a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784074417; x=1784679217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aADQWG87fq6XITbxBIYillliqdnDSadEcTkAR2o/L7Q=;
        b=s55aWvJP7M26uYH2P5eGMnJA8tUTmt70Qhmc3LqEzpdDiVmL/3N5pYGqT9YRhCyv1s
         Whz9u+PspTQ6sdiFLRlDecDH1uovK3/xDs7pn11ROXP4Xg/ItpD+dQLs+le6Mjvgwta0
         XIvlj5ewD5FI+7Zn0C5PPgUKl5nsV4NBIiLKtHNMbbwhhvb1yz4unwyS6KSKc1l5/XuJ
         DXaxBFbeK21Mc57gxkowL4Cbj01IOHS/E8q3WJlz9R+39MmsSkHM5aqSuYbA5d/z6M9L
         WHy7qSE1nA7SIv6gskEXHxhQrKoqdmuI0NjGz4owF+R04SXjdGiSUs4mD/LQNpWv8/7b
         bfRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoiYUE2vjl7i9CeMNFXwRPqpheR76B1mmO9DN41v36rhhc6zCfTpEiNLpxnHqzdvL95tcn2fD6bVXaDpp8YShzE@lists.infradead.org
X-Gm-Message-State: AOJu0YyO6aALs9u8r+uFsIyYCwPPTzCeV1+Q7w+FmlSBQeD501O9XbPF
	8sYtSaKe2Kwpm0H8wvTQqtBmF8pBQcHluLxTEJw9GWa2ig3rsF45K7EVX0xHQMsQY3s5xSqS97U
	LjFh0UAAC3yeuE05lZHV7pMMPXcsTiGuibIK9Tg9J3k+ff3fuZ2iePq7/6WiR8q0DmzxJF1n3pQ
	n1
X-Gm-Gg: AfdE7clna223obxcAc5bE3UnNZ6cya8HmbplMIr18yS3ifg5L+hhbLEa/gr+mURaU3B
	aRVnJ1UQo/ldhGna4RR0rZyWnxchgaY+NqQ75NRGew08O813oIDwpJC0VR4gdnNLnQnEOTv4oYb
	gBQfbM/7PyENRkpM3CaMbkg8D2Ey0xzALaLQAAdxnJPrz+p8khIzt56kZLEjLV68Ja+DeYPLZU+
	DtqKzbkl/xKG70kHssnm1N54QE6CSNv7ZAa1zzHDv51W8H8TpyTltkew5KfIHQEpRzluhCF902t
	PGtnzwZo4nu0Ffe2OVauzKg+DC6vI+D+s0DSiTNVqIq49DHV2SfUlzZFIka6jZrm1kxlZUodbSx
	3rS7MdAmyDRkS1DDMizJ76AiixZu3yoTtIj/vfFhMtgeoL2txOAY1tw==
X-Received: by 2002:a05:6a21:3998:b0:3bf:6c08:fb98 with SMTP id adf61e73a8af0-3c36c4099b7mr705224637.58.1784074416918;
        Tue, 14 Jul 2026 17:13:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:3998:b0:3bf:6c08:fb98 with SMTP id adf61e73a8af0-3c36c4099b7mr705190637.58.1784074416440;
        Tue, 14 Jul 2026 17:13:36 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c865asm92038212c88.11.2026.07.14.17.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 17:13:35 -0700 (PDT)
Message-ID: <9892de2f-9e29-41ff-997b-a6a2e7c98585@redhat.com>
Date: Wed, 15 Jul 2026 10:13:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net, x86@kernel.org,
 linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260709093111.367851-1-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260709093111.367851-1-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5IabTxj_gfpUp-aM5RWR-6CaxhP-0QHkDcg-9Uu0SkE_1784074417
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_171342_181820_70EBEAAE 
X-CRM114-Status: GOOD (  22.87  )
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

On 7/9/26 7:31 PM, Ben Horgan wrote:
> This version fixes a couple of non-functional mistakes in v4 pointed out by Reinette.
> 
> The patches should stay together so please could this all go via tip.
> 
> Changelogs in patches.
> 
>  From cover letter of v3:
> 
> This is a new version of Dave Martin's patch [1] to delegate rounding of
> bandwidth control user values to the arch code. As there is now more than one
> architecture using resctrl, I split the original patch into two, a core resctrl
> patch and an x86 patch, and added an MPAM patch. Please let me know if the patch
> break down and ordering is sensible and whether the pattern should be followed
> for any future similar changes.
> 
> This does have a user visible effect on MB schema when using MPAM hardware
> with 'bandwidth_gran' greater than 1. I'm not sure if MPAM hardware with such
> coarse controls exists in the wild but it is spec compliant and I've tested it
> on a model.
> 
> [1] https://lore.kernel.org/lkml/20251031154225.14799-1-Dave.Martin@arm.com/
> 
> v3: https://lore.kernel.org/lkml/20260515140612.1205251-1-ben.horgan@arm.com/
> v4: https://lore.kernel.org/lkml/20260706160639.2136674-1-ben.horgan@arm.com/
> 
> Based on v7.2-rc2
> 
> Ben Horgan (1):
>    arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()
> 
> Dave Martin (2):
>    x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
>    fs/resctrl: Factor MBA parse-time conversion to be per-arch
> 
>   Documentation/filesystems/resctrl.rst     | 17 +++++++++--------
>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
>   drivers/resctrl/mpam_resctrl.c            |  5 +++++
>   fs/resctrl/ctrlmondata.c                  |  6 +++---
>   include/linux/resctrl.h                   | 19 +++++++++++++++++++
>   5 files changed, 42 insertions(+), 11 deletions(-)
> 

Looks good in my tests on NVidia's grace-hopper machine. No errors found
from the kunit-tests and the MBW limiting works with more precise granularity.
The code changes look good to me either.

Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin


