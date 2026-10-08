Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAC3CA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GTmQaFxokRtWOJdiFeBX/Ou/YTJPcm5FTNprMVwfos=; b=4el30EhuRlgieuWmf89Nwpmp1y
	lUtUBVLbAGx1dLoEZh3I5azRRVMt3ukBlCLx3DBYriw4GW1h4AVRMBmmVUwpIdzOouHlGk1DaQ83F
	eJ0GjKX6Kjmz/pwek/9EcFkUuM4rcHZiE4RmSylZKON8q2/JmxZ8RnBZJ1JawL/dFAtYxWAEy9aHs
	TaSG0UWXQVWNYqaKxl944SlpveDq6eFv6VoRafSAmItTjRBk9mlIcU2TWYMiJEUgBstjLoW/a5B6v
	HDIoCWAmEeAgWC53uRZRgP7KcIeGmPuiHlXwn/Omm0MQfALeUpQ/EpRiZI8ty5bDOVlhikdh090tb
	1nGPgNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtYO-00000004uG8-1B0N;
	Thu, 08 Oct 2026 19:13:20 +0000
Received: from out-63.mta1.migadu.com ([2001:41d0:203:375::3f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtYL-00000004uFK-1HeC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:13:19 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0GTmQaFxokRtWOJdiFeBX/Ou/YTJPcm5FTNprMVwfos=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791486792; v=1; x=1792091592;
 b=xSVMttUeUuIPHeQpJm6ueIo9a1dLiPPQfRC2ONMMgvy0PFzsJlXCL53TvjaaxCfPHF4Rm3i3
 k1eXz9Sjs3hC9QIDmsUuEFQqZAz7o82gVjST5jnJ8yhVzjoJhtzCrwOr8ZwKm3PHWAswDjNyx77
 YIHZpGxEMzUfEf5jTYCKiK8o=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 83e2d6da0006f14e;
	Thu, 08 Oct 2026 19:13:12 +0000
X-Mizu-Trace-ID: 83e2d6da0006f14e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba40832934so212e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:13:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByODOK3HM59pqcmdPYSxedTlBkDBGa+M2enBesQIvf5WJfWiaXgNDXTBtdJxF6M/uyrje4l5nktewC/H8Hgpuap@lists.infradead.org
X-Gm-Message-State: AFq9FYJf9pf2iS9hs9ymvDzgb/gkxuDp7qXH9TxzY2+N7VfLvnyxdhkf
	PqtBnB6NMrXWGGF4wRYN6JBEocUqbabjVPGjRLY7F5Lp2eGmpDN8vjC+4sX4Lz3heoRkecO+OOD
	+LuKcIbvoTSRp+vDJJkAuuxLV2cEla76vgcIHyHxI
X-Received: by 2002:a05:6512:3b25:b0:5b8:ebf3:3370 with SMTP id
 2adb3069b0e04-5bcdd51a3c2mr4841e87.5.1791486791535; Thu, 08 Oct 2026 12:13:11
 -0700 (PDT)
MIME-Version: 1.0
References: <20261008104212.3134550-1-vdonnefort@google.com> <20261008104212.3134550-2-vdonnefort@google.com>
In-Reply-To: <20261008104212.3134550-2-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 20:12:35 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzworzPjJNdsFuOn8Jy_qDm_dhrgKqVsVKAdhzu7n6+KQ@mail.gmail.com>
X-Gm-Features: AclHuK_YRyUU2-fzg9DOXVPL5Sq1bOD0ID3Nxy6JWAxfr7jy9NZNQ53tG52YgK0
Message-ID: <CA+EHjTzworzPjJNdsFuOn8Jy_qDm_dhrgKqVsVKAdhzu7n6+KQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] KVM: arm64: Prevent 64-bit overflow when computing
 hyp clock rate
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_121317_630567_AFB4FE4C 
X-CRM114-Status: UNSURE (   8.80  )
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

On Thu, 8 Oct 2026 at 11:42, 'Vincent Donnefort' via kernel-team
<kernel-team@android.com> wrote:
>
> The hypervisor clock rate is delta_cycles * NSEC_PER_SEC / delta_boot.
> It is computed whenever a deviation occurs. If the delta between two
> rate updates is big enough, delta_cycles * NSEC_PER_SEC will overflow.
>
> Prevent overflow with mul_u64_u64_div_u64(). And as a bonus, simplify
> the clock estimation with mul_u64_u32_shr().
>
> Fixes: b22888917fa4 ("KVM: arm64: Sync boot clock with the nVHE/pKVM hyp")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

