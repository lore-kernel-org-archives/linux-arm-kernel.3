Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643A9C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 00:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDbonQLIoOSfVB1dApPM6LkzNs1SHNxOM+rrSsaUBBQ=; b=mzHe5Dw7XcudGTu+sqnEjuMTDf
	cZKcl5/HYsPRSwzT/MaYAtIsqHFhL+prBBn56sjtpjyAMIZpqpmeAVYSqYLaOKF0CXLhER31kCZhf
	DM4Z15QJPtLiaO5LlaX/xUyykqK8hBczeKnK7KsCx0PKMZS+eVz1HzMO4XT1kDZe9fC5/pfFp6WVz
	KTNSnUjQRscyAdkLxNrJoKFOpnK+c+GUDUlfS9RGw/WjDZSfMlu9wIpYlFuEJkrsxuMn/KVrYesVq
	lxPg/p06IKalTDMs42Tsv28f57We0GBd1Zd/1QWBjXezNGSUGRylS5rOudhuaC3rTOHwb2Tr9vS41
	Pb45z8VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnFC-0000000DTw8-3TQC;
	Wed, 15 Jul 2026 00:12:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnFB-0000000DTvn-2BPH;
	Wed, 15 Jul 2026 00:12:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 274FB43CBC;
	Wed, 15 Jul 2026 00:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E381F000E9;
	Wed, 15 Jul 2026 00:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784074376;
	bh=SDbonQLIoOSfVB1dApPM6LkzNs1SHNxOM+rrSsaUBBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CMYw2FigPP7WfHBpvhgZlAhmWy0bpTPXB0dWdx6Sf2hHBsld1RyoxLlCa++abrtsP
	 6EV4GohitQfVk2wKCr8O71Tk0CdeD46bXWbAd2OqoAUCZQKX4FEbqODHs0l9VZXgHA
	 iRubQs5iHitl98Xt++qJSvdKnk6DPP7t4j7rCfrbbuns2ri1g0rNuDJt2wPVOI5RQC
	 Gkks8B8BofuZ3kPdXy6OKqse1ZB5GzONMooax7IYKIEDgxmK9JfdyAwMg8UBJjWMwL
	 te64+fdolGgdSWPyG5+w2q0ZQPCiYtxCHLkkE2gxADmGExi2IMa1LU+wdk/ZFNBGYW
	 n+XWGFINNchSQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Subject: Re: [PATCH 6.18.y 0/6] cBPF JIT spray hardening
Date: Tue, 14 Jul 2026 20:12:40 -0400
Message-ID: <20260714200600.stable0011@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713-cbpf-jit-spray-hardening-6-18-y-v1-0-755f60c55705@linux.intel.com>
References: <20260713-cbpf-jit-spray-hardening-6-18-y-v1-0-755f60c55705@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> These backports harden BPF JIT against spectre-v2 class of attacks. Without
> a predictor flush, execution of new BPF program may use stale prediction
> left behind by the freed one.

Queued the series for 6.18, thanks.

-- 
Thanks,
Sasha

