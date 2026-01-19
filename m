Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37ECCA5FEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 06:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mW8pP14dIZ9h6OGU2CKcs3QTdvvegnlzEVF253nUeTI=; b=mrEB0E+AVUGY506wOJCj8y4tgp
	vPaZbf24aIPKOgqOB8mpMYWx07+n72ud7bvHX8lVFfPDn1p59Z7BaGDD0wqu4x3uJfTwJiWG1xDTf
	LSw6J6IMIEEm4sxrsyYvjucfQsVsJiT4nQkOTv05naVoGudWp3xf9Fy5y9pFFge/sBvSixnb6f9/n
	xmkbvFQU6hgmxd28w5oA5A77bGsr2CQvJpmP9ts1FL1j/cuTL3heLbDEMKhv8TznbQB6K2++hv8M3
	Y2+27xnzdPwqQRrzKL5zjCrktJqvwx8j4SXd7Bz3+Zl4xXa4P+lo7pM4v0BG6NvJtX0mWj8TbNCR3
	QPLf2xog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhiww-00000001Psb-2uWV;
	Mon, 19 Jan 2026 06:41:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhiwu-00000001Prh-2cYA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 06:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768804875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mW8pP14dIZ9h6OGU2CKcs3QTdvvegnlzEVF253nUeTI=;
	b=A4jUjoKj7pbu+6JJSUInwvvA+egky5ognBs+VyXk2fuPbhR1OcnEltEPq8XO3b+2w6gkCe
	cSGtqnMxqDy1m8Ek4NH+oUye0+b6q/bfKKYDoEyR+NaGi6q6aLlGVV9ubX34XWdRu+7eZb
	5o0dHf+u6qB2nCn2rtfJW31Hivte9mo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-RuKW_lfsMz2tt-4HZ3eYkg-1; Mon, 19 Jan 2026 01:41:13 -0500
X-MC-Unique: RuKW_lfsMz2tt-4HZ3eYkg-1
X-Mimecast-MFC-AGG-ID: RuKW_lfsMz2tt-4HZ3eYkg_1768804873
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1f79d6afso44564595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 22:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804873; x=1769409673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mW8pP14dIZ9h6OGU2CKcs3QTdvvegnlzEVF253nUeTI=;
        b=VxYZkdwx0Ne3frgqB+YiZX2rlA4ISBCCse6pKHAfFW4uCOXzjU13T0lbjqtZjJwWUO
         T7qysffgS9W/CFYU0Rn5235wqxmPzlbCBRn3bdnXfbUIA3QoQz05NOGhSpYCJRZxKGDt
         KSjs6NqfDWnKRk+GsDWaZe0+/EEP+eNPM9mhkWQ6z3t2AzPIx1sAahdoqwFxvBvapFk6
         1SEEtMkzM4FGu+xGG3d2bV0LMPbcOFqwXMgGxTQ0NDnAGy9iXuNF1WJcvWBm+IwZ9QBR
         7mvQo+reGXBYE/gmU0Y+6/nfybuwrJLcywMpOiS3Iy5B8tC2ooZvdjE/E+JtYfDl/a0m
         eoZw==
X-Forwarded-Encrypted: i=1; AJvYcCUGRWQOnoWn5MN41UgSqOVGt9a+PoOZk/9Yk/0pCaSSXOwJT8yaVQ5Fd9+U/VKnBFqizALbfkwe8OgLmzzZ4ilS@lists.infradead.org
X-Gm-Message-State: AOJu0YzvXlm1a7viPvI6Uxzpox+m21/1z/IQc33q5lhKTkghKo/P+Hgg
	K4bXmNV0x3IekhUXutRpLo73bIy7E7tfB9GVOdA4XZZxhWfipTkeRzeeDwFIwOXo6RjqY8oCwgs
	k9G2hdzL4zs0OQ+DSo+edsz2Szd12lO8MKfh/LE0ZWLlbz+F+EYuvkSEO07+Pjd7oegcjQD8YRq
	ym
X-Gm-Gg: AZuq6aIQgrwJDkJbvwJYkQWWcC/c+9uAMmihrTwIAWKIxuVbRhs5cTYNCJ1YxMOpCmU
	bNUSnFwzGZCm6Rp2I6G7G8ip2+m21sjUK1T6CaqCWfAMYE2EgaA1V7ECD4D+ywn7ih6U+JU9wWL
	btK2d8XRWyjdli7Tvttxs2S+Iy8biwWxnAmiNN6IICeXrb5C28U+wsaTtfScxVXIilvGojQKitI
	Y2dbRpVq1rKwSaNvwck7deC/D24P8/Uis25613aiWE6eU1Putz1V2JH4GEIW4skDj3Ndiz8VkO6
	UnlhCQlakx3fwDrL3z+0JA7KSY7f/8w6IxnQteYjQ98Q2s+CB+g0GHBkTMFb7ow+NNq45CfgrkY
	Oc2jnh8zA6Ws=
X-Received: by 2002:a17:903:1206:b0:2a0:c58b:ed6 with SMTP id d9443c01a7336-2a7188fd7c9mr94199845ad.29.1768804872814;
        Sun, 18 Jan 2026 22:41:12 -0800 (PST)
X-Received: by 2002:a17:903:1206:b0:2a0:c58b:ed6 with SMTP id d9443c01a7336-2a7188fd7c9mr94199415ad.29.1768804872333;
        Sun, 18 Jan 2026 22:41:12 -0800 (PST)
Received: from [10.72.112.128] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190d14cfsm84741095ad.38.2026.01.18.22.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 22:41:11 -0800 (PST)
Message-ID: <a0d81df0-901a-4478-a07d-e9ee61d21300@redhat.com>
Date: Mon, 19 Jan 2026 14:40:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/47] arm64: mpam: Add cpu_pm notifier to restore MPAM
 sysregs
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-10-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-10-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jfVqD6LYHVUurnFxdADTEO9TIjkGT1jJPIEl-4XulG8_1768804873
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_224116_752048_C960A94B 
X-CRM114-Status: GOOD (  12.24  )
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

On 1/13/26 12:58 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> The MPAM system registers will be lost if the CPU is reset during PSCI's
> CPU_SUSPEND.
> 
> Add a PM notifier to restore them.
> 
> mpam_thread_switch(current) can't be used as this won't make any changes if
> the in-memory copy says the register already has the correct value. In
> reality the system register is UNKNOWN out of reset.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   arch/arm64/kernel/mpam.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


