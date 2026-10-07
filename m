Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1C5CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3BovMqKPyOzodOG6cYU5vpG492YG/WZZeesFshGEqQ=; b=I31825ADiLdsXugtEgnrQrhU/Q
	DsE7lqjHyhYlGWNkPf3AWvhqNcmAIRczrJoKv/jyD5xw7a97FJpX6+Frszt1MPh+JRSH7E8unxMMp
	PlazpnriPBk1UcOaQywn1IQTFSXf2+VRa62hVxsIebilPS+97xniuux92p/CMPJ7mdv9W3i07KJuY
	7ddLheJsSGvm9R27zQP6FEVjrAurFtiIDXrVRqw/mAKwWdd7eUzL0enG+mmWSgsN0u07AwlS9sqsM
	qLwZpFMGnbk0qvo/+W9LdfLU45LToXL/x/BzVG7y8T9O25aByp4dZAgBdz617yAW6x+JzXJ3zayRC
	fn7YwAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPyy-00000002LY8-3qen;
	Wed, 07 Oct 2026 11:38:48 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPyw-00000002LWx-13lJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:38:47 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5841e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791373124; cv=none;
        d=google.com; s=arc-20260327;
        b=iiEopq8mtY2gmcU4vtwGUTuKsImEBzpWmO/PgqTOOW/twHYZq+JP7WU3ildulkafyP
         mwlnP2vLP3iH1taCI8WWm1rV/yhUIDHhP9nB6jCYZTu1G4a8z94o47PWhgNq6F8Dalz4
         ACL8UCtJaLTdBeyH5XwPf0lRN+BKiJ/J9PMdN1obMFu2VT62FYJcq/5ajZ1K4n8PGACN
         rdydOkhpCGjv+1w2bCtl27wjKF4fs5ukPijQ0LO44G2JIzpHjVkjA148ZVcBp4sR02fF
         ks68gDx27clk0Hv/1nXVk3JlOjvPtiXgKa95pkpMhm2QaV3W8xWabM9x1s54oiRJBIOf
         lmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x3BovMqKPyOzodOG6cYU5vpG492YG/WZZeesFshGEqQ=;
        fh=Wu6zl19B1nZwdzfBJHuos5py2+ZcNKtS0vXyUZPd2wA=;
        b=KmjkCqBda799ryJOzhmWCc/uudzrSEynGVNR2gL/Sl81J7mgrZab+hXXU/y078i2FB
         gSkRJ07QcaYojdVMwEsneYRW8GhbDOlpJXzVTj2JMD1SUVY+ujQvzWVzc+f+fjrvCxIa
         QctPNUq1d7hi1sMSpodr4MsPsoJ80MZsFmFIjQM3v6nFWIizZ3WKiyqd3fmicSJeyLPy
         OnV0UH+SI5sFDtpn2JxoUBEMVs4C9/FRwGR4O2CGh3H64VGlc3Ki2rbwW7ISr+gBXB71
         4fptdMWY+rW/CNMCnhJdxLKCupUz5rJRn/0usC9Jw6otnsSkYKU6+ZsjhK4+msL8aSGv
         rB8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373124; x=1791977924; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3BovMqKPyOzodOG6cYU5vpG492YG/WZZeesFshGEqQ=;
        b=LtE3dKa+9DKNfb0caI7h7M1s86J1hkyhob4Op0btJ2RAE9hrhkBA5XwaQoWntItuQI
         9PYtbzJdnUn9X4O2sqfQiZBCaaBUO7ELddJCsE/DFd8Ld9jVoqE0yav/yq40QJl7mMIY
         bgigGwwhIGhhT89oOdEbiYLzGCA5vl44UuWKdU1tVLnepyrigrmMXGK3bpwKYzvX34r8
         zjiGUHxu9yDH5moqoTXFFPJz4hD7EaAFy18nxCGd8S46jLzt4SP3UKa8554Y6cJhMeWw
         ZoYiNqmiDRR2SgFxHj2iIF0H3+4z6S/mNAYG5//tPJKAqa+dqo9xi6tBjM63KTw75gFO
         c3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373124; x=1791977924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x3BovMqKPyOzodOG6cYU5vpG492YG/WZZeesFshGEqQ=;
        b=dm4Yd9oJ0tGtTFx8EzTCjNwYG7BO0iH3ZyWsSCX/IYSR9Wi+kzZq/q89kdlgKSdatE
         3Ow0Hy59u2Hi0HXu2ZM/46NxPM/0ZuTHrTl6EuBxdngWaIBzanKeoK+zATmc2zSHB6L0
         GF8B/9eilAZz6MHNFmD4MIwUDWi5XahkQuJ4RyuayGIBy1eRRGmUPz/uoOAodgXmCB5E
         yfGLXCTKzsCQ5BecCD4fJBDxDeiL8OjNEDmSl9oKtLIdo/WIZT1nUi9mByvtx7jAc+3A
         OLtT87Lf8AT+zzi7CgtAuyeYB9evsQ/XfrSO+THWR10KnHzzEGV6dYxvP+lHYCaZwCmC
         HYgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKommghBUp8h5JmANYG46SKwZzxW0uHMFZhF/zLYxNTuicW4ul4ERVf3LauOVCIk/F4mpJc5t2mBdesk/L/2Rf@lists.infradead.org
X-Gm-Message-State: AFq9FYL74e6q1rt9QGfEqPSLTFUklUqIUyUugqQEjsKFLjU8vfkGpuVV
	rFMqTOp962EcixZE5msjRLjAnsRt5hf65KsDTZ5ewQQnFBhwhsvIQZYZia1o9dvxdYqeEzR8Zld
	Ybj9npd7SSk57jRdDwtISCp4d2IhoN0oU2u7tDM5P
X-Gm-Gg: AYBFou2T/h2NQOqGf7WR8YCe7JOR8Kzd0Uf2diKbsisVE9XndINzcosgJ8wxMOMO1Rc
	cL4ErHcJ2yWpn/5fsi4zYdLOJnpMto10dmVKwzXiwa1WEs8afjQRz7Ta0Q4dBi2VbNECWXZVX9Y
	zVOIPrQUQ6lQPSkjR72D9FDh/a/S4Joz1wGo7VX7U2eDSARkO7wReOu/Uv3Obw1bmXYYcvfuFF4
	h5ofOTNsO6Oib/ku90vxYkGDy9XeuxC1sVSlZ1ZjlnnaJatMZAucIRrpiSKv5UZsWsqX/kOX6iL
	bUMGJUQgqXAyPYfCSii8TBWRdQ+AKy3ULxY07xcCOI9qUk7ZUQUXjujUv2Aw9KX+
X-Received: by 2002:a05:6512:3f0d:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bcca857470mr322236e87.8.1791373123590; Wed, 07 Oct 2026
 04:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-11-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-11-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:38:06 +0200
X-Gm-Features: AclHuK-THf1WIqt3xPRpWJs1Q81-pzVnFszT4A1vRUwtheoFlxrVY7-HpfrRH5U
Message-ID: <CA+EHjTx=CoD5vUN7X6VcuoLeoqXeF_h_JVuhiwaHLBqNraZg8A@mail.gmail.com>
Subject: Re: [PATCH v23 10/14] KVM: arm64: Add VM specific callback for S2 MMU operations
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
X-CRM114-CacheID: sfid-20261007_043846_323296_93AC4D3C 
X-CRM114-Status: UNSURE (   8.10  )
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

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Add VM type specific S2 MMU operation backends which can be initialized per
> VM flavor, to keep the handling cleaner.
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

