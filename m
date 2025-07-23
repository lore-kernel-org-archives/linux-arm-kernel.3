Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F66BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8T9TfCkafV99HUq2TR5S1MsMF69AzVNNy3QhV0IlXps=; b=ONAnZE0zjwdrVPf9HVIzCo568A
	G0DUV/RBLe8ML60g+E6SXiu9K1bAEIrvTQm5AI/VlL6ih33WgHwOxftf2XJp88V3eF97Xp/qRxdWo
	zrwD3n9KDmka3hUn8QV+FZDLVx1KvNyTXRf+BYN5kfEvi7zXcDpb8mVcDEBlAF0tS3kDC0aFQ1vbn
	czkO0h2RxQrF2hjdemxvtJWl0C4Gg6AUGVQbDinuU3Qsma2jjGcLbSf1MGapsXyZXavUGK+ImmU70
	hOY2HEHK2+xW4IxJTbcDbXdS8ddPbjuWnfewzTyi+hYVKFexVYINlGrJAbuNgwEVYokivcbOa2wLY
	8CVLWvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebj2-00000005QW6-3cKM;
	Wed, 23 Jul 2025 15:49:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebYA-00000005P9E-17ZD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 15:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753285112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8T9TfCkafV99HUq2TR5S1MsMF69AzVNNy3QhV0IlXps=;
	b=FnL0di6KpPapMrr6g5tynH5AoimAa6fp5xnVWQHEb6PGrME9GRVCO13cMhT3qPbV/V152S
	3CzZRv4Aj6kdw2cvpAjOn1HBN9gRcZTXDZjJv7rtx1SQuMwGU6e7bP4NvVdOmabl0kE9fF
	c5cM8Fh+9QqYWW4MggHfZDeMMVYzJiA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-UI5xT0hzOMak14wFdTvD3Q-1; Wed, 23 Jul 2025 11:38:30 -0400
X-MC-Unique: UI5xT0hzOMak14wFdTvD3Q-1
X-Mimecast-MFC-AGG-ID: UI5xT0hzOMak14wFdTvD3Q_1753285110
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4562985ac6aso68656625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 08:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753285110; x=1753889910;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8T9TfCkafV99HUq2TR5S1MsMF69AzVNNy3QhV0IlXps=;
        b=tS5a/LpuXyZEDka41Ogc2KO87aA5lOIJJVs4Fd+CDS8BxOSYuqFTJkIgSngYt5dhu3
         HZ63lKhxMYI+82Plhi3GrfUCLu2YND8UX8iT2YX6Kc1BZfefxhO+c9iKeu8Pz9fCfVAt
         /NadOmGB2Lms1R5FXQCwr1ztS6h8Hdru+pVD5/a4Jp64qbcXh4eCKB0C+p7FPAwd8+UR
         FfSI0EBKflqYu8qx/7umWf7/vHd+8heIrlW0lf7BQwkNb71Lu3B5n60PWP6XsVFYZYgi
         OABGaB7XlgQjDbM7/XTTinGPgvUJApB0teQr+bveikwX+yg9wcqvsd4SbRbH9YCB8HNB
         mHcA==
X-Forwarded-Encrypted: i=1; AJvYcCXgl/vs6/sM+EqWyrPDBt6OdgXJeiMPoXur4MkpgMbwYMUOyPvZFvtmj+qsTsxZNY+wYy6T+JBppFSgJ9aIOFzK@lists.infradead.org
X-Gm-Message-State: AOJu0YzshZtaVlE59NX47JjoDC7RJTFnxHA37ExMQg9QL0o3wg8l6Hb8
	RmT+Sz3VAeC12zXkXEfISQgChA3eXUd8trPNKtm/4hzPWc3ihCbL16rjPQCl4ke15ZPDyNMCWkX
	oN7ForXxXGnilzVMp5/a1KqpIdoDk3aFne59EMoFX3wAWb89W/5qeCyLCsMMCUg8xfBy9hHmkG4
	h9
X-Gm-Gg: ASbGncs8sfmLuL9AUQcJm9+mhvdkkt271sEcE41okgPnQZDk/3pHtYiye4TAdTGyGpr
	x6PXmMoXU5O954vFrTHu9WDJEeGLYyMNa0Q5ZVUwNB/5Z/xOxMvRGTBZG+sk9MfTfqa4wxMTHY0
	dfaDP4YPcFzAUiyst61UJHnJqaLVjdC586UPVKTqnh/tQe7zys0icrDUpPYRboPRvhVWpFuAn5m
	ruS/IlHWq3Gvn2hdZVOac+v4uvj+k1LXkn962cHboaC1pC6qQmO/lqUd9Q7E/20PWGlkxS0v3jv
	YMCU1lp5BRQHFCvUauMfC85/6nwjeg7BvBx7SiG1QBqWs2eNj12yRMwiS98EYbGMkKxQXKDenpD
	QpsH3W/4bPhAE
X-Received: by 2002:a05:600c:80c6:b0:456:1560:7c63 with SMTP id 5b1f17b1804b1-45868ed969dmr23929855e9.3.1753285109556;
        Wed, 23 Jul 2025 08:38:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6wYI6fkFZoIyQMYYcyUTTH4h/csKxFYyTSF+4/JYLoYoXAjDzqJFF0JRN11ufGYAYyBF36w==
X-Received: by 2002:a05:600c:80c6:b0:456:1560:7c63 with SMTP id 5b1f17b1804b1-45868ed969dmr23929625e9.3.1753285109123;
        Wed, 23 Jul 2025 08:38:29 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458693f8dd5sm26144725e9.36.2025.07.23.08.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 08:38:28 -0700 (PDT)
Date: Wed, 23 Jul 2025 17:38:27 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
    kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
    Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 1/4] KVM: arm64: vgic-v3: Fix ordering of ICH_HCR_EL2
In-Reply-To: <20250718111154.104029-2-maz@kernel.org>
Message-ID: <b03eacbd-b8de-ce8e-57b6-66207c4b5559@redhat.com>
References: <20250718111154.104029-1-maz@kernel.org> <20250718111154.104029-2-maz@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2Qi8sReWD1CRYOKcgP4DdNp9yWrzTir2VRmS9YsT5yg_1753285110
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_083834_373175_1DA259E8 
X-CRM114-Status: UNSURE (   8.24  )
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

On Fri, 18 Jul 2025, Marc Zyngier wrote:

> The sysreg tables are supposed to be sorted so that a binary search
> can easily find them. However, ICH_HCR_EL2 is obviously at the wrong
> spot.
>
> Move it where it belongs.
>
> Fixes: 9fe9663e47e21 ("KVM: arm64: Expose GICv3 EL2 registers via KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS")
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


