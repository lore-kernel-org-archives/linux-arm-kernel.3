Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39AECA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6PnbIvoXOZFv6pPRVmqWiNMYIregQMXJAxqLvuHzdE=; b=r8umLZikpLnxOF2BDYv+GxhS9k
	Vq8+fAH3ebAlEEP88x+6rGsdbL7oZi90n9nzPNIFScxut+tuRm9fqoiBJ8abgZ3ic9N0yMVUD3szP
	MR95MbQLWTpIheLLXOy+tO93K0HMFGyDsvYgWFXg0dNqF3N9eu4gF5Ia3mfI2xi0wyWHYkQmFPLz/
	gx6b3pVjqcbot3vmTB5u3mKMPH1Eah80ZPv69lMSyggnX+s1fHUwSrYjc3Dt+orunyKWT0bcoUyNS
	B0HPoVt9b0u7jGdQCbI5yTGyPRBlB7v2o+6TOpf3fO7t8shftsHQlhw1Hq5CvL2X3iI5DIYgndH2E
	TKubWwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPlH-00000002IqB-3kg8;
	Wed, 07 Oct 2026 11:24:39 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPlF-00000002Ipe-3RPM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:24:39 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8054e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791372276; cv=none;
        d=google.com; s=arc-20260327;
        b=k2zU8N970oh/yE5GNncoBT7j8eFzZBzdM2xFb7CGJRSA/MAgG9FGBpjU3fs1vXvy+D
         cwV/lZDYnYLlCigM6EoodCi57peU7PLUTA5WLlqW7yglaKHt+GARBaHmsc7mr35xy0/3
         moy4qOw7R/j0zAzSM+g5g+58GReN7+KgdBMvdiUU3zC8uZ4bXsTehOaTZZfDDB8B2WYd
         SapLBXVcFi1PT8hKTp9CbbbNA/bzYala/hteWnwuCzZEW7PiHPmZ2ilJFlqP/JJXHopG
         LHlb9mtGRd/9fOSqCwf62ZMvt6Y85VU2mTruaeme4W3RWkGySdy4czRtYVKaq2q/lY2e
         znCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e6PnbIvoXOZFv6pPRVmqWiNMYIregQMXJAxqLvuHzdE=;
        fh=4XL6VI3wLx1RO5a2FmYUlKKQKh/IP4Uls4/kk84zRHA=;
        b=cQy+3WU6be+b6FTt2m3xsEUn7NpB2XOOLfRitKfM9KOppMxBv5ffnyf/YJ69MdCa2j
         xvMTZetiJHiD4UVAAKkI4RQB4qRYLl3URfjmO4n6vjJcEoLDh7vhZwQ+dNYWJHu2CMNx
         3AVU+HBaTpxS/8RQyNxABXSa7jQkkWlai9pLD3L6ZOtd2CPF7/jhagtipQ0gKgcxnXs4
         z0WubtklFL1H0ZchkdwHMdoEYZAYRgAVgkUqabxYOgRcKU5TDP/6vj8MxJ8ElgwmdrNV
         /kvuqjJTaQWMISro1VYIn+vQbXxjeBw4gDi7Ss1BaYB2dhbYHEbtgYXLIQkilKKpKiEV
         RGXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791372276; x=1791977076; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e6PnbIvoXOZFv6pPRVmqWiNMYIregQMXJAxqLvuHzdE=;
        b=cEadAdqZzFPlwTg/VU2zyrcu9HoRy+jlJkAXwivpj0/hVz7PinBqiMF0e7tcnc+eQ0
         EBaBZtTfXKyNE87MZl0T4Ld7SS7IwNAEIHseSqgcSOWLGJg4r2WK673OxbCHxoINraLW
         PND7FQF5rsKQTikVXAd0nS86rWwY75ejjAeJkHpQMO4sT88jO50y/At4TvSFyZO+b9F+
         NZmBSbDhCbT1Rxz8FQJqlsi/GUeQg7wBmFMECUebhbjHPYakP5vdnHY5MdPMOyQcv2Pz
         MZPHl9W00e6thSecrUNwWXWqVwO7d4Y1ArJjHW2HRR+5br8nP/nc21gRGCJBlQ+oGwpo
         E21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372276; x=1791977076;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e6PnbIvoXOZFv6pPRVmqWiNMYIregQMXJAxqLvuHzdE=;
        b=DfBr94NaaAUw9IKaEl0Inx24VOwrT+ZACnO1fk8NTsnSwxhoKoXJFaAchZIyx6zFuC
         KD6Wr3vIYiHmHW8+NrFKA4lg+SdPJseukZoA0Xcv2ATApXARQ/oKb0LCTpFVh+j+Y4kZ
         6bcMZ9TZ54WXcCD+VvjrhyQ+vi+5fRxrri10WjkfLKAzv8a7WZwY9Il7kx5iRD19YbGN
         iIHx7ZbC+2PjAVYPyUy0zeZcMVwH/1Rg/J/B6y20GHskEwqLqux54aFuGXDaaNHUtJjN
         ettEYEZwmdYjpStZnwmISExhJfQeRl04fEhxCVRHu0bVvZiDPlIUYr7xBXTse9L/NoqR
         nyMQ==
X-Forwarded-Encrypted: i=1; AKwUvByvcqsHE95sJwFSe4yl8mFdoXFS6cJSohk+JpGpuSVpEqvHAGG9XOtJoUR/dptDZ6OhGEiqVCMiVs2gkYLvo0Uc@lists.infradead.org
X-Gm-Message-State: AFq9FYJg5a/Gy9Fnuanu7KxDcm83AI5NncTr7x8DvbgpEnMIMijAZWPo
	mvPStbVGn0QZ998++q5iW0/qeoPKHjX1tzeo7wsjvsSRDLWYlwKi5dhg/v9pPCAvcHhyMR1HUZd
	zJKvBq7PI3rj0rEbp6W+KOcpIKhXJobGkBMsAgYg9
X-Gm-Gg: AYBFou2M/w2m1E8wiZTSoDhC1Fwbzw1TEtyvHl6DeYNod5ftqYWz+HRWO6XVhZ8azzu
	TAOsfNEi9fzUulm7p8fDcN0V+/C7ZN7rCApz7ZXO5dQIqFgKt1cgy4jLIxJzrnBeYehiDpk5MFX
	10BcHYAZZdMfe+sizD17zKCOtvscdya3EXgFPGyUKiGDc7AbqoZmeIwZg/4q95XlfFj7O42Z1Rn
	7Wg5U2sBLp9bg5u8SRm7adyEvkvArJdWuLRw9XQMc7GQ5VKtyrixjtCOtvv1m7q6bpfjOav3hBi
	Dwk1+ScJbfn2gc1bFWM2hCBzUmOwSqTOUCLV6pXM1v0FAr6z/G+MhQ==
X-Received: by 2002:a05:6512:3f0d:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bcca857470mr320723e87.8.1791372275119; Wed, 07 Oct 2026
 04:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-10-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-10-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:23:58 +0200
X-Gm-Features: AclHuK-AkPhTBNuRx-Nil52s88bZX1XXziZHk8i7cIYK8SeGo6JUTxyL14CKqt4
Message-ID: <CA+EHjTwHBasTofGE5YQj0WfyN3v-uHykPxRL57AWJGhAO5Pojg@mail.gmail.com>
Subject: Re: [PATCH v23 09/14] KVM: arm64: Consolidate stage2 unmap range into kvm_stage2_unmap_range
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_042437_881646_782D6C97 
X-CRM114-Status: GOOD (  11.81  )
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

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> In preparation for adding VM specific backends for stage2 operations,
> nuke __unmap_stage2_range() and fold the logic into
> kvm_stage2_unmap_range(). Also, make kvm_unmap_gfn_range(), the only other
> user of the __unmap_stage2_range() call the kvm_stage2_unmap_range(). Also,
> while at it fix the comment to make it clear that mmu_lock must always be
> held while unmapping. The code already mandates that and the two call paths
> do have the write mmu_lock held.
>
> Later we would replace the logic in kvm_stage2_unmap_range() with VM
> specific backends.
>
> No functional changes intended.
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

