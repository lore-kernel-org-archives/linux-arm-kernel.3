Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49F4C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rbo7h4rkxRDnvPMepezk1IQU7FqRhlGxXh1btLN5y2E=; b=xHqmG+pfAnKDkJRFfvZtPkRYEh
	1+GOJxRXlp2jthNo8F1yqEDRR5KKGpaxZu4Jyv0G/WiKBJ2bo21wLMclECRv5ydErfUc+9VHOzv3s
	jfQf1Yo6Pxqjuuf2brS4LFNWL37dGP6y/y+hstRlOk4JN5GeaLza47H+rGnTUp+pAg8tImo3U58h/
	7iu3p+ugkYBnMi4EgjghAy0L7GT5Pgo+uheD/YZuE3tdwzBBNWEkoUdZMR1qLpDA5soRIOCgbl/vo
	RsUmb62Na1oPMqKuK4OKUQGNJ9QdIc4KVCTBZIaSDrN2YSYmntUm5VFPbOK6koaMD3dWH08a9mrdP
	CeNfnfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7981-0000000B4zw-1qWl;
	Thu, 17 Sep 2026 10:14:05 +0000
Received: from out-199.mta0.migadu.com ([2001:41d0:1004:224b::c7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x797y-0000000B4zc-1flk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:14:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Rbo7h4rkxRDnvPMepezk1IQU7FqRhlGxXh1btLN5y2E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789640040; v=1; x=1790244840;
 b=BqWF7g4lvcVWDqDnNWw24XIyP1iH6aNOJTA2/AuJpZAoRpHChJhY8bO7oeSfuye9D4UOrOdL
 hcdt2Fnee7YvygHHj5J9lmwur3ckvlui0AdKV2UMB8PAAy/MtEeESFCU+5jWdHspMMJCb/G3VA/
 Q6s7DUzRS+iICaJUu8KYAvro=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ecc8edeb826a1fbb;
	Thu, 17 Sep 2026 10:14:00 +0000
X-Mizu-Trace-ID: ecc8edeb826a1fbb
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso392e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 03:14:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9LxXkjkz2O71aN6N71gIP5TuJaM43TQtgu5W3FhE3gmHgNmRiSQdiHmzAdfiRcGbyI2MjqgXFlmyvCB/gw8+V@lists.infradead.org
X-Gm-Message-State: AFuF++k+PTX35FVixEVX4ep7rz1OCtswZDzrkFPX4U532SK5smMubSdR
	RxslylQnnY4alcEfyhN1ESUGL4rJ0T9JoZ0dZ4F4dv3wFfPT+fQm45CG+joIY6UIX81j3d3O1n0
	T4VWL9Lx8642voupu0ZFfm147t1jh6thgXukQ2+iJ
X-Received: by 2002:a05:6512:2241:b0:5b4:9dba:7403 with SMTP id
 2adb3069b0e04-5b8bff3eb66mr3729e87.13.1789640039154; Thu, 17 Sep 2026
 03:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260917081510.1539013-1-vdonnefort@google.com>
In-Reply-To: <20260917081510.1539013-1-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 17 Sep 2026 11:13:23 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy+4m9Ot6ffBaGDyGEHu-aTSrLGUAGn+e9EvWnapeSv4Q@mail.gmail.com>
X-Gm-Features: AcwNN1VBxrUJEsCWo-F6cReUIsV9zhdoQgfQgwlbqAmSpDfO-6YQjEKPuIzcJo0
Message-ID: <CA+EHjTy+4m9Ot6ffBaGDyGEHu-aTSrLGUAGn+e9EvWnapeSv4Q@mail.gmail.com>
Subject: Re: [PATCH v1] KVM: arm64: Disable stage-2 ptdump of pKVM
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_031402_695677_202B4D8E 
X-CRM114-Status: UNSURE (   7.06  )
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

Hi Vincent,

On Thu, 17 Sep 2026 09:15:10 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:
[...]
> Fixes: 7c4f73548ed1 ("KVM: arm64: Register ptdump with debugfs on guest creation")

I was wondering if this should be fce886a60207 ("KVM: arm64: Plumb the
pKVM MMU in KVM") instead? Before that commit EL2 ran the guest on the
host's kvm_s2_mmu, so the files dumped the tables in use.

> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

