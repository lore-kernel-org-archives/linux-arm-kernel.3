Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8152CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PmFoTV1MhIrlyB9q/nIr5bTRr/fQsMqTgmO60KsB8I=; b=g0FIDc4x5x/Z5T4im6D4wNgVgA
	8S1AJRfvo3Dn+O8sV0PGKlH7+HW5o3okDRC4x9LZVDKpREuFHi+S0ax+AzFWU8nH7KvyJxuK3gj47
	KjXOw2mkUqG51XXmJ3dxwSByOLsgAkMaH4DyS//QZZmrm6n+ilO4k7ZlNNMbhEf/4ctueYsC3F1S5
	dnLlLjLXNbyZ+dKhXYSrwhj/nlfBwMSxXrn03vYxSmZ9j/e7kod1T90UaZn2u6gLOCtDyEVL1DqM8
	N1XcEJTNCKJFG72ZKaONBjRU5OGZWxMWHGp82GGlc6gaQnANwqjrWmZHRypJmRoPnsAQj8n6eB56Z
	KsWF0sAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZVH-0000000B8UJ-1HDj;
	Fri, 02 Oct 2026 09:24:31 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZVE-0000000B8T2-1gWB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:24:29 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5ba40832934so4281e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790933066; cv=none;
        d=google.com; s=arc-20260327;
        b=JSdOdKnlqlKExuvSUGWyyjtyzwwX+zhjpcICe6aAOAIih4FyZiRPBSUvwKZUNKjkFE
         2V8IekHaG7kY2eHk1Y43TWt/UK6X/WFfik/nbd6YSKoq9w0hqHFsw6Mb8KaWizPpHB+c
         hq3oKK+eY3Cv8PTWY27GPDdjnSdWs1jhrQMtyb/5xPwGYSsdCoTrIoFiT7tjj27FAHXo
         Pmz17X4jxSzoReYIo6XECmksE5V5KAFNFQi854f1JjVWc5KvvZGI0x0nUdG04Oeyb99q
         JYPwJ1cFhXiv6A+hRcRKCkKgdwTguxLJElLq41qpocsIUFdDbVMJpiuloYmc0hk9Jhx0
         6csQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7PmFoTV1MhIrlyB9q/nIr5bTRr/fQsMqTgmO60KsB8I=;
        fh=qs9b09Xt22G17Pv+lHm9d9Aa5+u6icHSy2+y5yVxnSQ=;
        b=i3awVRBKQxQsu8EE9Q9HFvgEUEaKq4gFbJmNWGW7c6LHyeTLHu6rYiyU4e38OHi7E2
         mcMpD+3Kbo78uCMyVoQPbtQR7l9PIKEkJLzEhPIco1IvYHxu3lh5oluqMCZQAFakH8WI
         RhaZGJNXqNJ8AN0PdST1TxCc4Zpo77sM8rdQuZO4Yl+91St2UiK2mNVAtY23Dvuy8CBx
         /Y6+tbYCd+clRvSzvZet4LkSYkduL7z4APAGgiR0xMKOL6b7GK2D/W6pGGDCD6Sgyjr2
         +0uYXL9XLKkHchN4IlmqlnraH0/beAJ78fLrjpaBmEXr4B1MYPjr6U7NfuTrz13+tlnd
         EInA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790933066; x=1791537866; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PmFoTV1MhIrlyB9q/nIr5bTRr/fQsMqTgmO60KsB8I=;
        b=pBamKfwUmEbjZ8/nPN2gH7cLNcxVa582joyIUVxzpwE5jF4S/l+RxbA4A9t5Mt2ipD
         vPe+nleq5i6McTw5/0Eelu3YR+jL2dw9noCiO6hvllc84ZE6uTToG/td3PBd4LT3ZKMY
         Si6e7wF6nWXWCG2/O6/D+uRehj8HVwL9H99X27cKe2foJQi0buebwHVjk3D0ZsvJJHxq
         IRfTRgutVb+39RX89eHD3xVLBMoXCTFW3hJ9pl/q7y8vHMAu/2pBM57e3hoWey1h1HT5
         CWEPbPY1Idr8fBupHk7WgMXi6NYd6J6lZVqp9jipc2Hyyc7PkPcWZTKh0qjxW49d3+aK
         LOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933066; x=1791537866;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7PmFoTV1MhIrlyB9q/nIr5bTRr/fQsMqTgmO60KsB8I=;
        b=EhRnuqjf8gvwJAy2ycZzbYsw4FJTBVwQTrnHDJ1mVzXdeLkkVeo1Gi3ntaP6cadQqc
         rnsE+S0HU+v5B/vRekuAikoTdQrab/C0aRjKfRWPsC7dTyF8ULQN37se5PIF3dlfP7+h
         EoqpqPAzu+EcXFMTP2/KSl0vF0ofnAi5FTR4QQOs1f5rRDZ3pkBF4+OsOkQsoRqnXnuS
         lMKKi0ASfJoUG9XLkILr4forjPtkqbVb7EevF6wgFaU2GqOtSBFG+xXQ62qPbDk4c3Bs
         uvdxWaIvF61H3XmZ7X/1W78GU/70Z1qftGd8+3StSCvNunnn/zrg/fmWwSXdbsiM9QOK
         tZWg==
X-Forwarded-Encrypted: i=1; AKwUvByJU2k2iyu8QrcfIlRFn+yGk3RDGtQVxygit+raawPGaLcWO7iCeAcz13Im30z/h7Y/ScU3pR8ZPjOw4ZR6XHO6@lists.infradead.org
X-Gm-Message-State: AFq9FYKvkWvEnfKWWUAwjlGfyuBz0bNY1OxHPDBbRg9qS5wBSj5OF0+6
	yWAjH6OBgG70fvxqUha15B2+m66MvQMP1gcpI7d5NdSwhR694ZUtNRvcmK8SHXLjWrF6HR6Qmly
	wGUhKsub4Hg7onqh6SssASofus6fEsgbtuFE2QgVI
X-Gm-Gg: AYBFou3LjR9JqavjihMiHNe4MXij6sBU5pIf/dY4Nbb3n+FlG1eCtyZbhmEYr1CTCGh
	HLEfnSAGxubAKSU2nIjHOtjfG/7MehGBrLRWudv3d483vkR+UWaKqpFQI2ZqIwXbG9XBeCx/yWA
	+0bapTGo6Fw1P1pWlx6rEfAVh2ZhhnvLYwFOPk1PB+Iylui5C3trvm7aLBTsNziW6Rg8lJ65kit
	WJTd2AWIj9oQZbEgotjFizg7ZVRla4WL/Fu+qeDG4mGHYdHa8zyF23dSd4Rff+lKhS9Uwi5OqVY
	kir5S5rr0/qwGrUTBulzCgSSB2GFTfJm/8B8dxd4x0Sd81vwXlftJC4sjGuuLhAO3aJR9HVOAdR
	Jd6kItfJ7KqB6hw==
X-Received: by 2002:a05:6512:b8e:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bbff6fb595mr82503e87.14.1790933065552; Fri, 02 Oct 2026
 02:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-14-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-14-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 10:23:49 +0100
X-Gm-Features: AclHuK_iAoRmEqRhd3Pqw1bLNIyTQ_Nu4t-bE7ReQMk3jjFJ4DGtZ7fagNuCSDg
Message-ID: <CA+EHjTzz+nmaMDQBXt2e4RU8YcsJOJkVevygJHsq_jbon8PsXg@mail.gmail.com>
Subject: Re: [PATCH v21 13/23] KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
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
X-CRM114-CacheID: sfid-20261002_022428_459243_D284B551 
X-CRM114-Status: GOOD (  10.82  )
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

On Thu, 1 Oct 2026 at 22:08, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> pKVM does not trust the host. Realm VMs follow a similar trust model, with
> the Realm Management Monitor owning the protected state instead of the host.
> Add a helper to identify VMs that run under a host-distrusting hypervisor.
>
> Use this for blocking ioremap of vgic-v2 into stage2 and prevent creation of
> VGIC other than v3.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

