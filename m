Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89337C3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 17:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpY9JtnGzcvzPu6O4P0Dx+xFkkQyMIXI5/iH9ew2AVQ=; b=Ys5h2WkFJEmtz6i7I09oXMcxRD
	Ffffe/ar08TOPP74iGeOH3Fkjr5QAawPCiZabOnOb0Y0UGK/SaX7kLnEUscr5hsabxEhA99X9gR6t
	LOve8JfyZ8YQNo2a6Jum0GmanaNBvYA+5x1va3IuQmHNnktKIYGUIW1ES4WvL4OBjA8ViCU8d083D
	KPaSc9/eU/GuyxEYVbeRv94nN/ScMeTpt2akr9xOHbYXyxaWqFszHHPeT/l2ty2lO+Z/RJQDSbVUb
	ZFWKRx2b4NV3uFy8ZBKczRqsuFJJAE0IOa4Wx9VwBEck49WdBhsPKDEAvmjPz1C+6c8Ia73/11KBl
	ozTsmwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2Pt-0000000G3i8-0Xp7;
	Wed, 14 Oct 2026 17:05:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2Ps-0000000G3i1-12fo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 17:05:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CEF8438EE;
	Wed, 14 Oct 2026 17:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D931F000C4;
	Wed, 14 Oct 2026 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997523;
	bh=bpY9JtnGzcvzPu6O4P0Dx+xFkkQyMIXI5/iH9ew2AVQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LqQ7PzbgsznEMCrl2lw649ci+U8Zw7Q3jiKYim1jfBrAGBIUfl44JMeDbILpFyOdh
	 sZjp49YXLOwWMxK0zcfly6oioYJomjj5V3kFQaDvZoZ0SP8O8CyuUv4nHjHb26SdwA
	 zM/d8OE3CGyIwrWdjQASdukDOW1qC/eOn49S3TAUjAHPXA0JKcy8x85OVRJCav93OG
	 NaWdL5I3p9KtjVHUslG+BMd0iMueSMWioIoMbqYx8I8Stg0B0+/ZIpDjgEOhltJtF/
	 92PdiIHAcMPA3MrvG6Sp+WeqwqsLZaPUTpg1p6d4Xx24SCEs98zeeZyRy66W7oEdHO
	 7dujPvhUZ6v6g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xH2Pp-00000002xwS-0lN5;
	Wed, 14 Oct 2026 17:05:21 +0000
Date: Wed, 14 Oct 2026 18:05:20 +0100
Message-ID: <86pkxc1acv.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Colton Lewis <coltonlewis@google.com>,
	Eric Auger <eauger@redhat.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gautam Menghani <gautam@linux.ibm.com>,
	Gavin Shan <gshan@redhat.com>,
	Gokul K <gokul02k@gmail.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Hiroyuki Katsura <hk590@cam.ac.uk>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Jack Thomson <jackabt@amazon.com>,
	Jiaqi Yan <jiaqiyan@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Jonathan Davies <jonathan.davies@nutanix.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Like Xu <likexu@tencent.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Oliver Upton <oupton@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Sebastian Ott <sebott@redhat.com>,
	Shen Yongchao <grayhat@foxmail.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Stefan Teodorescu <fane@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Will Deacon <will@kernel.org>,
	Yuan Yao <yaoyuan@linux.alibaba.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Subject: Re: [GIT PULL] KVM/arm64 updates for Linux 7.4
In-Reply-To: <CABgObfbkbEY_MuD7Y=Y1GYSrHjp=nKfE8-Vy+QHqKMyCVurJ9Q@mail.gmail.com>
References: <20261014162126.964330-1-maz@kernel.org>
	<CABgObfYVHtFGopM=vCY2vt2N-CON=_5BN4YFiZknwvyrgP5mfw@mail.gmail.com>
	<86qzhs1ay2.wl-maz@kernel.org>
	<CABgObfbkbEY_MuD7Y=Y1GYSrHjp=nKfE8-Vy+QHqKMyCVurJ9Q@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, amachhiw@linux.ibm.com, catalin.marinas@arm.com, coltonlewis@google.com, eauger@redhat.com, fuad.tabba@linux.dev, gautam@linux.ibm.com, gshan@redhat.com, gokul02k@gmail.com, hemanth.selam@gmail.com, hk590@cam.ac.uk, itaru.kitayama@fujitsu.com, jackabt@amazon.com, jiaqiyan@google.com, joey.gouly@arm.com, jonathan.cameron@oss.qualcomm.com, jonathan.davies@nutanix.com, kmehltretter@gmail.com, leo.bras@arm.com, likexu@tencent.com, ljs@kernel.org, broonie@kernel.org, nsg@linux.ibm.com, oupton@kernel.org, rdunlap@infradead.org, sascha.bischoff@arm.com, seanjc@google.com, sebastianene@google.com, sebott@redhat.com, grayhat@foxmail.com, xueshuai@linux.alibaba.com, fane@google.com, seiden@linux.ibm.com, steven.price@arm.com, rostedt@goodmis.org, suzuki.poulose@arm.com, tharitt97@gmail.com, vdonnefort@google.com, wanghan@linux.alibaba.com, weilin.chang@arm.com, will@kernel.org, yaoyuan@linux.alibaba.com, zenghui.yu@linux.dev, yuzenghui@huawei.com, kvmarm
 @lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Wed, 14 Oct 2026 17:56:40 +0100,
Paolo Bonzini <pbonzini@redhat.com> wrote:
>=20
> On Wed, Oct 14, 2026 at 6:52=E2=80=AFPM Marc Zyngier <maz@kernel.org> wro=
te:
> >
> > On Wed, 14 Oct 2026 17:30:50 +0100,
> > Looks pretty good to me:
>=20
> Good, applied (I idly wonder what the x86 maintainers would think of
> KVM growing a memory allocator...).

If x86 ever grows something like pKVM, I have no doubt that this will
be a requirement, just like the whole caretaker thingy will eventually
grow into a full-blown hypervisor.

Bloat knows no boundary!

	M.

--=20
Without deviation from the norm, progress is not possible.

