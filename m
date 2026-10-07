Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462EFCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTU69CrXg+oUNUa21qt+heVePxURpvvJ4P7YR2kHJSA=; b=aDaTQG5KOPADC/bUsspjx8QP+3
	fKpBLIJzthZHgHU3WjOy3Y7s0fRlfReYgqfgcutrr3HADrkJb0n/myx+oMhpjYNkkurGAQ+tyix2Q
	Sz4xXmWe83LrWG9Cel19M9BUYGqjoyxhGK3D7ABII87El/CDlXr+V6RrO1f4TgcND84ylpDFPKz79
	WP/Hfb2/ph1jlPPd0DO29SX8lxJtAILPZ9XJ/iOrnASk1MS6MIr7M5eTd/2/bxfb8UOyLnUOAgKox
	d0mppkKUCtoHMMZoMuq6ex/t5LcCaarBvRQSnX+xWvK4M8BH9JVNU0UYAeQUw/EZyFHVIcPdNPtQa
	UJF4AQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPgB-00000002ILl-2niT;
	Wed, 07 Oct 2026 11:19:23 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPg8-00000002IL9-2Iiv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:19:21 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8028e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791371958; cv=none;
        d=google.com; s=arc-20260327;
        b=CLYGEPdc5zKUg2OnSp+7BiEWSInrzojJ7o26gTQIw7Eex/z/xTtzv1JxxPs5Q4FKHE
         09IXs1Wiru9JqK9kz7axT0/ZgCENpB4gZDZCFbknvfn07uR3ZXDKt0EQJr4Nsos/iO4g
         h9FGYSNFv9dI8r3/oIPxBp0nqAIAXaKtopHo74opPQRWTim28zEs2kDQSX77iRrNx7Ky
         H1RJBoGrM1uhd9I4a6Y6YGHbjO9hsv9bYzxNyzrCbxxzcpKzjMs1OrjYM7WbF8UV1pPI
         poeqYy/uOpQGESqgUwULUtNi8sCB97NqLjZRvbIYXWICJdwUiGUD6DAdjjPnQb2YOd4/
         pMZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VTU69CrXg+oUNUa21qt+heVePxURpvvJ4P7YR2kHJSA=;
        fh=rHUT9+HOhLqyWD5U0BQoUMYUW7+7DWBPi4MAWpqixyk=;
        b=gcueo8J/+KnG1mIwfI8/jVZAHoS/bYGNIWZf8vjfB469Kf8HfnUHBpVv/275VLEpvG
         TdRsFWmoMaWEWatQBiPGCfDqkxDmeVtXgagKeMyWP1Jsjs0JjioSyzW8FWPPsKu4nCia
         1zoFOu4W7IVQqPJMBEA4CogvhneVbFsiSoY4sqgVL4lPQPlwXNLqJTjHt1q9E8giIUPN
         1XvMN4efNo4tlVTuKNtdXxRVNxz2f+ZNVPCFjzMjlGKa+vWFIg3T/NUpTSnbEMHGQ3nZ
         qp4UmqgNbtbOtMRdDKUp2RWbG2hJY1/ZPIwDLBJeuz5GXTeWUIzSdd9zT4wjEEhpeddk
         3+pQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791371958; x=1791976758; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTU69CrXg+oUNUa21qt+heVePxURpvvJ4P7YR2kHJSA=;
        b=wEcURhzZYK95vAy1kxc8dhA60RllGIDC5Ty0qWg5axTgRvt6eOr+txrWGMrIPa/NPe
         VQv1tQ3LZ9+UQ6Lk3GbLHZRYbg4ATVq49lP44iDzlhb669m8ec0pfjp5jzbyKUh0EBbC
         bf13vQAQJEzrjzohDSNZslWr8v/92qxqXUt9BHElHx/qW+A2sytAfJWOnu/dfaMCHRGH
         DvO3IDq+ETWxSOzB3Mb7s1aXxMvIATuBnWrg1GBvFBcGKqGSB+s9FMJDD3ACKpENAkMr
         ybR0JDlZQcVqsI2+G4TJF38zJEpW2FcwhJok1hmH3QluZClDMoxOUoOA/TUG634BKwPw
         MRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371958; x=1791976758;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VTU69CrXg+oUNUa21qt+heVePxURpvvJ4P7YR2kHJSA=;
        b=TfBdEndhJiVH7icVS2qOeHCkwptJkTEV6FONnzTC/lmsK7OxiQEoEEbe3j4ZHdqVVZ
         0DbVzvHNHO0bs+0LMhi0FsMUshZ+DPqtZ51kFVWkGZ1sawZgQpV/MDjldxwO3H34IpWn
         ioGEKIW7bF96UJeLH5OXrmgQs8x8d8Ae2boZ7xnXV0aaSKqcSrTTnC8QVfRjHezDhZkX
         FO4acDwnk64xhG3VOkViPiEmafMQgQRFSRbRrpHICOdrkkn5VQKgtMqpqo0sSK249Q+d
         tD5Kgv9iYErHjfmOlYTnlD9w572kVsyg2EqWqPSW0vHl8MCebXvk55qCPeA8KTof2n8J
         WMlw==
X-Forwarded-Encrypted: i=1; AKwUvBws/w83bqD0kEMKH147ojg9TnZ1MVdJp0XdhYLN0B1dNKbeCf9i2+EfrH00uYQjCeoP9OgnsCiY+Dldf5QpsX0Q@lists.infradead.org
X-Gm-Message-State: AFq9FYI6W9ZkC+7PEKspOvFLSYMIhJVnxdjALRJj9MSya4Hh5mMpldyB
	qjV64u9nwtuTBIIagvxA6UycE0Wfpe5zxR/sQcSwEJJLuXa34jzl1+zTAbJdjBtpZCo+2SbU6p5
	Gw1aS81MBZx9pRkI2CMjbahC+KmBtVQypKgipxLql
X-Gm-Gg: AYBFou3AslNE4VCU26j7y2x8DcVHwKAexQ+cZVfsm2q3DTrMlAwWkZwqIxXerQfftxZ
	HWc3YpaHc+7QkCQ3WHThwAt7BLcpHJxqEp4dWxFe/uMc+dv50clzmnPEHmoP8Extpi7t5rzE18U
	iVGjU7eg1W0nK9Civ1wj3M9eZpkuCDduXPpOIx6utzCubjZzEVgOUIcJtww3zvhdZHDcjtABSA5
	Len5K12iSpnS0pPWBHj6dPEpryvQddx2F0fxLITJSBAIrsv+2jaJW/PHrPHxbyXEZbV6gJYrxaJ
	h6Z9e7p2ilG7XgWPiPYCuvR/coMR1QZqLIs2GhwuBlnQVpcf9tL4PA==
X-Received: by 2002:a05:6512:1385:b0:5b8:e262:d32e with SMTP id
 2adb3069b0e04-5bcca7ec141mr318055e87.1.1791371957703; Wed, 07 Oct 2026
 04:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-9-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-9-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:18:40 +0200
X-Gm-Features: AclHuK9FLvM3LbOukRQncRzEinU8YnpJHc3NQvReH44DvOmDcByJyESZjTaqDmQ
Message-ID: <CA+EHjTzV29F+MoKAKum1rUS8ZBd2j2w28yQWfHL4ymfJnVzG=A@mail.gmail.com>
Subject: Re: [PATCH v23 08/14] KVM: arm64: Add vcpu load/put call backs for flavors
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
X-CRM114-CacheID: sfid-20261007_041920_613195_30160C03 
X-CRM114-Status: GOOD (  10.33  )
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
> Add VM flavor specific handlers for VCPU load/put, in an effort to make it
> easier to follow the code. pauth traps were removed from VMs running PKVM
> as it is a no-op for them.
>
> Based on a patch by Marc Zyngier
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

