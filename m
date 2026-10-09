Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67301CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X91Ea0i/B9gu1Cdd3wVY7vcLKA2e9/BIdZO5hwAmvwA=; b=CMrriftOezh2RZW1ZhcmYuwEau
	5ypPo2KjDI7FdK/cW/JWixKkd190DA3aGlKX7vKfY6QofWkMY1ZoNa4JLE2NKfg+sC1r2FhVijQXK
	R2DxcwpJBBCUTRFr20vqcEIdXtVP0P/bOBbenxvbgPeZ8t0RJUvqnQEQlQz2u9r8hTSPxsGCq+n/m
	XCAkyCJ2Mz7xQJo/gbjBTQ7/T9nq8bBRAjiz9EQm2b5dnrvcm4n1qfmvabQ4ZhU+QP5SLc6GjnSUU
	g0Bgx7p6GMt7lQ0WGFVnVg1c8rVGxCm5llLlALy0lui1jMFw9tVl6nu+9Iikfjrff3lbWEeVHBLPs
	aOnZl5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Zh-000000060uB-3yQp;
	Fri, 09 Oct 2026 10:11:37 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Zf-000000060sc-0XJn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:11:36 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so6873e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 03:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791540692; cv=none;
        d=google.com; s=arc-20260327;
        b=NbaJqgjk3QdKGE5i8JG+6RKaV5srvf2EDuFnimN0/1yziukIARed5DNjwDebc4u2Sr
         GgOq9/xevPndbbuVw3qZMn60Wu0N/HfM5gx7XoW/BNwJhKy2dxvVW1XktaypUchDAMeH
         vArB9X+k8AsgH0TARwFkmyfWC4aP01iG2RORwMhwox7mDimMaPAH+uGbpihNi3gmJZX6
         MJjvYFpMeqI2/xTFNKcc19htC40H3GtBS08hLbREMu4ZG6Rx4p2+U3ByE3S266WHmdlG
         LLJ/N35i0iF5/O/pl1Bi5Us1YdsAtg3sccsobbIns/sJ6Zfj01NGXetekeOLVf/SKMS/
         fyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X91Ea0i/B9gu1Cdd3wVY7vcLKA2e9/BIdZO5hwAmvwA=;
        fh=tE79HBITx5sj5Uact6mF55v6n8478ILOeRcPnlT/r9g=;
        b=f63qq3HCTllknTLFAxCeuqhRABpzv6aP27YKbEfJKtEHLDIasqwxVWfz3/BNBPqIW2
         9gixQXA7b1B/Jkr21wNK3dh0JIEoCwt2qSIzVuYKyc3mVtykgtk0fw2YogYPDHdF2c2W
         jo8QZY2xfTCCvisOaOXPqwXeGnTJZ/iWx592fW6cYr2bL0HKjMZlB+1SFoPI5EYfyPNo
         Q2GmyT1UQG0IeZSdBXuJtlvfrbR7Xf4TncEFSvu7HPN8b7JCmJ/k0bazS5TGPVyWYahM
         6DBotezuGG9jA7LASas1YPvuP5iscScHEybCEFtld4iGjNYYeKtRdO+0h+HtQruPuZ/G
         AS9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791540692; x=1792145492; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X91Ea0i/B9gu1Cdd3wVY7vcLKA2e9/BIdZO5hwAmvwA=;
        b=XzlPpO7ZVpoWBVMdOfggKK8+7gdXRhQX6TRV7HRqMrT8xtxM1uO5qgX5GCuHftHqcC
         T6TwnDkvhjkA3xkednNCnHkfXjh5j8Kxm72h6TVrSLN339nDKY3dC31TEpldvKFWUgfH
         JrWC+FWok2h9QRDT28cXGMENYZcxJmLqVoPzMXtNUFcCWqPuBIO65/heWEJy/R6m2x3D
         Dr0ynOzTGstBUNLMvmRBg+jYO6L/D/IxXTIGMdRBRac4WRouhfZgxENvtp71aby9+SXG
         rAMPtLzN6EEqzC9PrdqJFXGMWXbfAhIK1JqUbGFAXaraF4kCzAiQZ/BtWhxUZv18/M+C
         MeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540692; x=1792145492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X91Ea0i/B9gu1Cdd3wVY7vcLKA2e9/BIdZO5hwAmvwA=;
        b=tob8OjjRN6ek+J5u+Vdt392zQC+sYd4rQhjCxACw2kwGy4lrZzocaQU5zw6t3AUpQ+
         hnzKBNy3Y4kncaZOjoqCfmRPVPV647r9DcEKSFKo28kdwABrzNJ7lUmoto9JFSmYD0lq
         B73U+pUTRuEXeuRIBu99622eQYGk/rp4ao9tPmuzfQ+6xS/r5cEkFulS51OfHmDY1HoA
         BOAXNE40WtVAl5IGMJ+/xFXBR2SdNZHhfqvdea9ascpMvOXTrR2aHoMQX+O0hvbQY+G+
         7hLQqkL0Ftx5zpCxAdP24eeWp8Bw2S4HzvzFro9myGD2J/PqHF3N0VoxyOWey8Md5usb
         OWRA==
X-Forwarded-Encrypted: i=1; AKwUvBw+md6aG7IqXBJrlElmBaORTpDodDIhCc0q3HehdBZueSyklvFXX1Vij5cEkqcf2xkxCkS1kJBy2L7AW5cgMwVR@lists.infradead.org
X-Gm-Message-State: AFq9FYJStfJZfzGteULtm9PqLAFM/femCwhdCx15h2QGIoHEQWRf1k0r
	qkLhieadV0qTrSRLPgyucLTri7Cjoixsd59dp03/dq+MwCGQ4sb7WJGbS8NS+8OubZxwj+N1fuv
	Rw25jH3SVto4mRxZ8HjSLHtl7zhYm3ca//XwNYXyc
X-Gm-Gg: AYBFou10PxHZ70H6Ll4px3NfZujwXgzVMhomDxtg9KgCLQO6crHA2q+pTPxSYN1pbsl
	LYvrz3MH88YjkbnFqOOh753wfSoetXEUdTdECuEr81+EzHheiiFh3qYAZ220+TKltS/89gtn3CD
	+fFQh2OCL9/4CwYWHFzpzMb7H5RSHl0oirtAyDqQVjcrImLPRS1/i6fD5bSeTLmYPSgdiy5589z
	fAY/TA/7Mz6whWxMBTzrEWUK8WdiQ0S/dXZbHiEiXvVfbag9Dgu5P0YCtFjCp5wZkVWo6yrZdcg
	JoWKwmb5t+2tSZKeTOvftcx8ehWHIHBtfQ67399g/E9bVKX30WVegI+nA95VsBdNNCezWjaeGQX
	uytD6Mqq/plFKDQ==
X-Received: by 2002:a05:6512:6619:b0:5ba:4293:fa55 with SMTP id
 2adb3069b0e04-5bcdd5286e0mr89466e87.3.1791540691538; Fri, 09 Oct 2026
 03:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
 <20261007073537.2454351-15-suzuki.poulose@arm.com> <CA+EHjTx-niYPnnRDvAAiY3MXLpSYau_PhiBTCiE9mOYUChASPQ@mail.gmail.com>
 <86a4on2qxz.wl-maz@kernel.org>
In-Reply-To: <86a4on2qxz.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Oct 2026 11:10:55 +0100
X-Gm-Features: AclHuK9LIRInATLITNjOUiJu1KjVGIe10ULmW_HxdmRBfJcwxXlgGARzP-Th6tA
Message-ID: <CA+EHjTxZM2kEtsG7+pq7zygA8Mhwzai9PL7+ex1K35BPVSt6hQ@mail.gmail.com>
Subject: Re: [PATCH v23 14/14] KVM: arm64: Prevent unsupported vcpu features
 for VM types
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
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
X-CRM114-CacheID: sfid-20261009_031135_230613_9C9C48D8 
X-CRM114-Status: GOOD (  11.74  )
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

Hi Marc,

On Fri, 09 Oct 2026 09:55:52 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> A rebase would be a terrible idea. This thing *must* go on its own
> branch, and not depend on anything else.
>
> I can however fix things at merge time. is something like this what
> you had in mind? It compiles, and is therefore perfect...

Yes, that's what I had in mind, but please keep the PSCI 0.2 check
from kvm_vcpu_init_check_features():

        /* EL2 implements PSCI 1.1; the host must not dispatch as 0.1. */
        if (vcpu_is_protected(vcpu) &&
            !test_bit(KVM_ARM_VCPU_PSCI_0_2, &features))
                return -EINVAL;

Folding the allowed set into the mask covers the rest of the block you
dropped, but a mask can only reject a feature, not require one.
Without the check a protected vCPU can init without PSCI_0_2, and the
host then dispatches the forwarded calls as PSCI 0.1, while EL2
returns 1.1 to the guest.

Cheers,
/fuad

