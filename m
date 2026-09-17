Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38069C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdIwW+5qYXXR92NXdwAH/Idy+Qhx8FbslhR3tYZnWQg=; b=SQQeyQqAQdghAEgaGIXo/QI9i9
	9YyD2FkQ6arWi/bqkrOS4hkIaShpJWGr04Cd0tjBqrME1Qg6svXntNbk3agYc41X6WVes1rJL6poV
	4vRcpsHzIfpPxDNqZVx9FI6PkRVTRmCpZzogjr6rcRRkg3iZ9KDf51Ph6GyVDH5nYRJvZzxSAxvP/
	4eppPZz/dx7K1bAGA8VEDutVl/183sg+ba4umD/qdlLQ9mCs+SnOd1vEwLWYk0s8H99jXnZXjYLnw
	evs/vI8vUrxjFc6GOT+CBWnlMXw5M5sSiq6U5nknPk2ZSJb9CW/AR9tXaufM9BxrgS0xKBE2pHnPT
	WRb3rvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Aef-0000000BERj-3EtU;
	Thu, 17 Sep 2026 11:51:53 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Aed-0000000BER1-0CfX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:51:52 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so1056e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 04:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789645909; cv=none;
        d=google.com; s=arc-20260327;
        b=q/OUQOO8wWP3FnKX3ia0pzNqKxH4YbyppGgZwF5f6dEOb+6S6yV0Py2A6eosMMAAOY
         bEa21/2M+QNgUWjZfkMcfa39nde452RInXrcOMBWQ9PwZ0yw9nVSwAHlyLfQ0ZCuqKhs
         ewp4fbm4uaVYHVzP4Y7RSK1apmHuevT/0tcAGm9mCuBtuLzuAM+1zuefMsdE8a9jxhp9
         w24h2XvZF/9/1QG0EveJNbapmP09p1v0Bi0xcGOx2w9HivreKohhDmyrDC39Zh8TlHgV
         kOOAo1/ClKc7LtQeRfX0IotQsrY+G7Nwu0cF9sdVOwvxMuO66TJta7s5C7nPUdgVRoyN
         5hQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AdIwW+5qYXXR92NXdwAH/Idy+Qhx8FbslhR3tYZnWQg=;
        fh=BtDN7uPI3n8rlNRtqc2B9xWi2joOaM4kbYEtElLPTBg=;
        b=SbJRWGYZp+lsbK26LWeUTug5PwHjtF+W/G3d3nu/ilUns2viVj99fKPk4g2+aJJGBP
         SDDtmgAsCaXAPBPbhoiqT6Lp4Bgwper/0snlH1gY0Cs4Df2aYtSvttZfyc/RMJOoY/ie
         odqj8f9x/2WzmYdFFcdf3Bj4IvRIh8vTwwhe2y73C+GqBEcu9Qma1XjxY0SbNsuc4fPV
         lTqn7jXqNMZqSAw2CVsxsBy3ItkTUVwBxZ4PLyuH/2qbeiNY5nniX/DFjgICx5Sx6nw8
         FHkBMPDAFiRzXXL0XhPOJth9u3ArXwWe40OILpVD4Blk4GiFpJgs8uNNWhXz0ehFiPvL
         Fx2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789645909; x=1790250709; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdIwW+5qYXXR92NXdwAH/Idy+Qhx8FbslhR3tYZnWQg=;
        b=OPW4aYoBD0gx2G1cGAW+FhqprLjbrJ9tcL5TpaV5qRmEIDVkl3eSRwgbwG2gUzpwZv
         ALnIUNi47RZJD1oYLTo3I+TlzYRamn/B5nTqaqjm/2as7zVVzt4KNbb3VbToXZgNWTa8
         1KbXkfZCjh/A+ferZE1xhjhD5qlv1GMmC3ZwczYayMn54AgWW65QlzgF5TFJ78o7toxh
         MCfQw3pIlmzhd8FTb7yZMIcPGSD6/jDWk5hRoZM6x5OtokotRF5t68tWk6RFGaKmBua1
         aIymIYtq7WSNPfVkzYVvXLWNRefU8dYZzhScH1ESwglmDLbq71voBljy7RUSOD8vD1dI
         U2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645909; x=1790250709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AdIwW+5qYXXR92NXdwAH/Idy+Qhx8FbslhR3tYZnWQg=;
        b=dHG/Gc0M1kss40TlZHAhGqdHu6JgC31EeZ32VpGi14soEnnEERWYRmiA10C9eI6OoU
         hbo6rMq//fpyvSRnSCbTaNYH5WmPJvgmSmW3T9f76+pUd4TMCUxazA7YTaz1eWLs3mhw
         PMnwdoY1uDtlosJUPwBSArFuoGBbcNWuc7oxX/HgMEownraoD4AWZOKLCj1TSC3ZdTL9
         qHyQMcRWjbutjBizgtSFT4+3Jwgpn13J0VreejintEZ1yvQyQbUimJL3snwL16QLDmff
         /9aZ2MZ4UDlM8Qekhlfc9/rpvxBTkEpMflalCMhAuj7AT0/qRZ4nFDyzU+7TRSpzw5H2
         Fz8A==
X-Forwarded-Encrypted: i=1; AKwUvByis3/LK32Rj/QUowDPiInritm2ZZH6TRgJNkThTbUB5fKyXiDhDpsdE4YVZPlRMPATZSl/PunLo/87G6n54okE@lists.infradead.org
X-Gm-Message-State: AFuF++l6zFqUcEG8fdZde/VzZc17+sC9JNq+DFShkWkPAIOKSpUFyx8W
	RqrGXiogsT4cwF0j7rfO8SN8WLyma06yxXHqHBtAJOHWFluW6KLt6m13O5jiIbfsWN0uob632MU
	Tnf20x/ROALrwrRfWYyL4dtbsgv6zDNswFRwEmnvp
X-Gm-Gg: AYBFou3VpPZIBdI3X1K5WBvYWqcC4VGBRLaT+NSE8r0IjMFVjDPAxARLX5SQswwneUZ
	iiprzW3sOGUyXLftEPuV/QOD+XjRSjOsnSKCVt6N++FnrqXPfTB4u3O0R9Vc2otiJfMeSX9Et4C
	Al9f/Hj/XrxtKJqm9EavmzcLwYJzz6J5li0FJpXXmE9FRGyD/H5QLAtcrziDOY4zbguSBD+7KuN
	3hJN1ZTKLQISTewUf9wzirBYODT7E+c4EW0sc7mivfhpSrWIN5JSW+U9b61Yj+PRtWizxWoqi7Y
	CAl2Nji/LnI8TjxCV3UWlqgLT8+uXSX0LBAGVYnD1bm/GPUeSNd5NsKDsMtIj09ifzfSLk7uIl5
	iNkbepP2qEzcRdA==
X-Received: by 2002:a05:6512:33d5:b0:5b1:5e30:ab4d with SMTP id
 2adb3069b0e04-5b8bff20394mr25749e87.5.1789645908458; Thu, 17 Sep 2026
 04:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-13-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-13-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 12:51:12 +0100
X-Gm-Features: AcwNN1X5WP4Na_O-dNFd8fWbgG-HeOkWBxaHeAYarJjcpr1hEP0fkdn3TrX09z4
Message-ID: <CA+EHjTxfbG6-LPjJVoErQ3iJk4vAvhVO=Qv6hjcxDXL0yByiQA@mail.gmail.com>
Subject: Re: [PATCH v18 12/23] KVM: arm64: Widen the scope of "protected" VMs
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_045151_103010_8710B881 
X-CRM114-Status: UNSURE (   7.45  )
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

Hi Suzuki,

On Tue, 15 Sep 2026 17:01:30 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> -#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
> +#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor >= __VM_PROTECTED)
> +#define kvm_vm_is_protected_pkvm(kvm)        ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
>  #define kvm_vm_is_unprotected_pkvm(kvm)        ((kvm)->arch.vm_flavor == VM_PKVM)

Agree with Marc that this belongs in patch 5. When it moves, could you
add vcpu_is_protected_pkvm() next to vcpu_is_protected()? The pKVM
host-side series [1] has vcpu_is_protected() checks that are pKVM
mechanism (the vCPU feature allowlist, CPU_ON against the pKVM
power-off state, the ONE_REG rejection after the first run), and with
the wider predicate those have to carry a pKVM-specific name.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260914113338.159227-1-fuad.tabba@linux.dev/

