Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7647CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYj7GJMoI4iyh7cvdiMZ7m7A/3iJ5WzI14Ui9Zh8zRE=; b=IP3vUsg1piMMM3AlWFrj+/ndP9
	kJpGSVHokO78fYx9H+3OQmkCtkLYIQqniTjWbVcN6J0GHXCM6dyKMujdygahJEBIYmIXH+MjoRdAL
	tQusVXTfiqV/rEZK58y0UakXzXkSropylJzXlrU52RsThS25AQJtxVTDMKEWPWbBKM4HCbW4UCcxC
	iuKOI+RnEnMcjTlpsrV0fnkVdNl6OERHKwJmeEDmghkBVCa0118dNR8VRsz97OTDrLjWUOvmF0AZH
	5abI9Yv41HDOy4+kZSF02yYZd1wOCNJmYVUaI9A1n1V+XRtXr7Jw8UeiNX9u7fiQckbJ3nPBE5ocz
	d/G6XzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPG3-00000002ETA-0i8m;
	Wed, 07 Oct 2026 10:52:23 +0000
Received: from out-47.mta0.migadu.com ([2001:41d0:1004:224b::2f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPG0-00000002ESo-1xTW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:52:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=IYj7GJMoI4iyh7cvdiMZ7m7A/3iJ5WzI14Ui9Zh8zRE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791370337; v=1; x=1791975137;
 b=LxvogiQv21xsbxJN0eZXyL96QF3EnVfTo0Leotc6UI2EabcKXarJRubm5ctOB+4KNERIfgul
 b2RA1v1vqBzYRPwa/tumO7TPkI1rHUpgvCv5SJY3x6JkfzqydQv7lF+ebuotfUe8pASWNpjbG3K
 elu7xmGV8+e8mj3vRBfwTOg4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9e26a6b317f5d547;
	Wed, 07 Oct 2026 10:52:15 +0000
X-Mizu-Trace-ID: 9e26a6b317f5d547
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so7439e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 03:52:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwOJy4BYaXgeV6C0+Avn5H1/P6JHAwv9ZgBdr30jiAP3JSMNGuIZ9DB135QtIZhJ4f+zw9Cv6n0wmLtYgm3kT1t@lists.infradead.org
X-Gm-Message-State: AFq9FYKA3vRaVBAaxIzGEkHfttOcrkS4CS/q9tCvVE+I7NSBCrpWEbcw
	oxk+8cc5+WZ98IaASWoX6EIcIz948E9/Ra+csbrYEYlsdG/jr+Z2/CyqeZti//3wqgVWcM3owb5
	uLarUTwFMF0IYhhKPwgy8CiXMKUxjthVINphQC79u
X-Received: by 2002:a05:6512:a89:b0:5b8:f20b:350c with SMTP id
 2adb3069b0e04-5bcca123ca8mr312158e87.3.1791370334717; Wed, 07 Oct 2026
 03:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-3-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-3-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 12:51:38 +0200
X-Gmail-Original-Message-ID: <CA+EHjTyb3-QoLa6P-dGXVdMh9E_vO3p8HceH3TH8h8gPJSd1Kw@mail.gmail.com>
X-Gm-Features: AclHuK9KvLpSDQrj6i2mZweuyXItR2scaGR6GbHNtuuSCxJB5qE1qI3r7GdrQYA
Message-ID: <CA+EHjTyb3-QoLa6P-dGXVdMh9E_vO3p8HceH3TH8h8gPJSd1Kw@mail.gmail.com>
Subject: Re: [PATCH v23 02/14] KVM: arm64: Disable Steal time accounting for
 protected guests
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
X-CRM114-CacheID: sfid-20261007_035220_669479_093ADB15 
X-CRM114-Status: UNSURE (   9.61  )
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

On Wed, 7 Oct 2026 at 09:35, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> PVTIME support is advertised by KVM_CAP_STEAL_TIME, which doesn't take into
> account the kvm instance. Even with that, a VMM could skip the CAP check
> and proceed to configure the PVTIME as we don't do further check on the
> DEVICE_CTRL. Tighten this up by passing the KVM instance around wherever
> possible and catch things early.
>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Someone beat you to it. This is already in kvmarm/next as a5b0f36a045e :)

Cheers,
/fuad

