Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80290CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6pA0UCaHovGcyxtuarmqmXJupW57jUc87NPA1SduJA=; b=oF6cai8c535DVr6VYW662Y0050
	LiWZp/KBJSKZ39VFEkmEwmvMxantBefA362Mf45UovQ4g6Z5LTmkd3zZftRboljcIs2dlYG2zUZAr
	e1eFjWmZkt9mJ5gtpYuUnTZZ9vmH+17tUnz3IdoeccPn0F/KSebblPMPdAHiMT1hA35ZYVrnXWYu8
	SoKT4e+tBc4NxeSPcYbz9v876B64N8PAsyy7muS+OP0iwG5j4ZRW7AfYdZCLBwdNLoicBlfL83KiF
	CWEzfysXoDfE0StTVqbDj2mqE/mng6Bd1ICcXP3s4eTVQADJNzFdAbQo/d83eCvFMp71k+rA4SYDN
	fDKyok5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPUv-00000002Gdg-0u51;
	Wed, 07 Oct 2026 11:07:45 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPUs-00000002Gct-3a43
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:07:44 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so7551e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791371259; cv=none;
        d=google.com; s=arc-20260327;
        b=aH7b80qlKwvRwSwTuPA/oj/PNdAEzJC6qwNruAntUy7drc4y8ZQ0G/3CjK8h5f8E3Q
         zNh7irUFt5zurKEydaz0NvHRzP6ukuGjRyQS30dVMYxUjZ8LL+kVpP6YKRMVM0V91i8E
         SAUXbBF0eOHCLMnO76akCj4mu96Wudx+c3zyDT/zDsaJs9m24ZwiBfuptmpXq02gLkAS
         LSRjy7S/SqlKenidONzU5m4OAxUcZ1FnEEzQrNMcQO7xKV8CF7Ul3hcL/OCuCqc47785
         Jp9/c/M9wECzTQnmzref2RBDnBWs8XA5MHvhrup5Dl1qIbU3XOTJPYmFjB8o/nHvjjv4
         n/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n6pA0UCaHovGcyxtuarmqmXJupW57jUc87NPA1SduJA=;
        fh=SShcY1WV2BoLAIjGtzsxGCYwqHez+CL9mABg9qoJ5F8=;
        b=NpK/QkbuK4HLHBANDSBhaG6x4z5WkKqqwh7J2+xkcEbxDfwS4LocyP4fR9uDZuC2mX
         6ianp3haHpG1RhpHhkqC5k2IJSOtZgjFVaqZwrqpj6rJ5KbTLWxMRySFLK5lLl0DjzCZ
         LbhR/69cDLFTUrzYVuzNJ1T6FWD+3xP/Trk/pvdvhtUQO2aH1qWSDt080rZkLoDbagY5
         5RA2P1ry05eHe+o6s/L7xGKPzjRpjokUZTJ/iqZuQkSw4YQRulNjPOXoPZ/+ea4S1ICb
         dgJlfuNr8tJTTZJXavug9zmC+Zhm7hH0ArtLthDrHZHSK2AF4STsGC3vbojf3F4Chdoz
         qHZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791371259; x=1791976059; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6pA0UCaHovGcyxtuarmqmXJupW57jUc87NPA1SduJA=;
        b=VIeqxTNl1OHlTdbtKp1+2qtVMOhj8ZHO6Q7ZQTK4B2J0hri23mox1O2dLA4sdai0hL
         96dKSncNBi6fT2avzjEc7LZa5uGe9nAtK4qnE2L4Qi3q19dUc3uYCpdvBK08u2Q5LqkO
         Rk4tWYGmmO23NAPf4p6OJQdjviFo9u4BIUVJx8yc2hGhKJHdbVNX1NDKbZm8w5vZ4OGz
         AO9MECrcCT+fcSlxr5bfDlfZPB2OowRsKcIlbDpYhRy2VA9vvNn7uWTnx+54uAuYOYnc
         r+m1IR49GGZe1zkZi2VZpymBuvDF5rd0AHV20975//ygL709IHtpo2ZyFThqQpTQrib4
         IFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371259; x=1791976059;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n6pA0UCaHovGcyxtuarmqmXJupW57jUc87NPA1SduJA=;
        b=146ckYPGQiUaFYM9qlxFP43UwluIpouJebNhi7iY/E79biTi5StUMaSWxxdJriYYCu
         2RMAsGgnEZm6eLsyHxy/uZi0C5WfKNWZK7tMJawKy768EOPYmT8eqasZArhcx/UcCxlJ
         3Z8ekrjZ7YrmpI12pEV8/jh+9lDGVGEZzIPfnhhVaBmFxQ7O8Dn5QIz6bujTexzE8vcp
         UTkLJQTQxsVqQTra2DGv35OQdsmIHhTXXdbs+e0e6gu+Pm2q0ib8r0fjyiZwq8vpFnKp
         Jb8GE6HdKoenm/HXA/NntyJsgmKEXKWS2X+IwduG+x1OY0jc6/PFdp3IYqejSch8AcZp
         hshQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeSJ1sWbEwzMa8umomWRIzOs7nswwKGIu380vE9smx+s8frtHEF+DqheUaAvgbQwZUMMz0sc4dpcPr5smSozbX@lists.infradead.org
X-Gm-Message-State: AFq9FYJepLBPExiBDqFMIZQanS1PjtlJFKHZFa+v1tb03CQHtMH+T8vW
	7jYseF5C/Z1jhSvVgKPwrZOrkQhC7UdayPW4qeQ7Xa0QoSXmAgQdVB2qLSBDbYbtf4JXxYKebUE
	NczwxADPfHFbJoj9NqChWK9GnmaEykVc9wHWRqjaBO8fC0Uj/kBo7ZWJEEzni/g==
X-Gm-Gg: AYBFou32HCcSAiVsgoH0hbAvgVbf7D5at6rqLtEDlWiccPnpsAQlIEv3DXAlnkm6BHU
	tHDkZ/koCykWh4niCTGeT6HHJYCEcVvROWgkCgGjiOAFitduRE/gxMaHDA3ccX4JGvo1Swqtbf6
	EgDScYD9hwEd835LxmHn/76XYZjo/Q+hK0N1CGQJqSKQzGWHOkOLtoqBLl0ZSTOlTBJ9Ke8mn2a
	+UBaTTwG6h1/wdsLaIuxb+tIvGZHe13G1b+o2pHtd+4cwMaS3DcjPyKXTxpyCSZa4r21YWie0vl
	KSR1PlaU8Mny4SklfJOYh3ohU/WulkD8XYjJrXszc9DInYnitVj9xtk=
X-Received: by 2002:a05:6512:1189:b0:5ba:3534:fb8f with SMTP id
 2adb3069b0e04-5bcca674bb8mr331538e87.15.1791371258668; Wed, 07 Oct 2026
 04:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-7-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-7-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:07:01 +0200
X-Gm-Features: AclHuK_51tZ4nsMn3i-NEL4Otzbz7dcWMCHjhG-tWBC19X6nKIZVcoWjuDrLVic
Message-ID: <CA+EHjTw=9e4xv8SmUggCgHBM+uQ2v7dWSOf9PeBufMUofYPMwQ@mail.gmail.com>
Subject: Re: [PATCH v23 06/14] KVM: arm64: Don't call vcpu_set_pauth_traps for
 pKVM host
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
X-CRM114-CacheID: sfid-20261007_040742_942931_16A4E0F6 
X-CRM114-Status: GOOD (  10.70  )
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
> vcpu_set_pauth_traps() bails out and does nothing for pKVM hosts.
> Clean this up by moving the is_protected_kvm_enabled() check to the
> caller, in preparation for adding VM specific vcpu load/put callbacks.
>
> While at it, do an early return if the vcpu doesn't have ptrauth.
>
> No functional changes
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

