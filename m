Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4FFC3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBbwIvFL38lVOZots084p2b19l+FJ0sPwwv5pZU2vv0=; b=UOjEvxLgwHoLcgK1Dwe10Scoqs
	ez1OlOJsl6EzcWwyTaLwyloJ2Auvze47qGaAMSuajAfGFpHUVbNvBERBzIERKEk8RmUGyMPqLzCYs
	ggAvwcAMwm3c7zwJRqntx8VTrYzGLi03UXs6IIoc8XsHX27+UeBoJopNsJq1366ncSFuPY8kW3vmR
	WSvuiagEpvCkpVM2eQPWThrrNT462t5Cyf+qcStg/XNK/92liaO+ghx76MwhEMm5YkiImnI8ghFei
	KlUyl/EyskVjWntvO9DK+eWUy9+4StgFF76reX9Z73tZnhJblDXv2dnT+ncMJ2gOULsJ5XmMzrkW0
	M/1WHnFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2Hk-0000000G2cG-3K3X;
	Wed, 14 Oct 2026 16:57:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2Hh-0000000G2bh-2kqW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 16:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791997016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBbwIvFL38lVOZots084p2b19l+FJ0sPwwv5pZU2vv0=;
	b=dB6iP+g8PoKb5XGQLmZsEjbVbAu7kmQ3yj5bSJqS+7SUJ0Vql4mkt8vv+4zapqQPG3lcFz
	2gSVui2xywnnpJ5p285TuunxEgzbxq13KinaKrh5UKEAi8kXa1VbFsUlhG/Sft8AtS+yPD
	0wm8xSbvohHLOEaXgHl09JTWqQyjFZc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-oq5IkwMpNS6Z1LClrkey7Q-1; Wed, 14 Oct 2026 16:56:54 +0000
X-MC-Unique: oq5IkwMpNS6Z1LClrkey7Q-1
X-Mimecast-MFC-AGG-ID: oq5IkwMpNS6Z1LClrkey7Q_1791997013
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so3884043f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 09:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997013; x=1792601813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBbwIvFL38lVOZots084p2b19l+FJ0sPwwv5pZU2vv0=;
        b=uMdBfuH250RfIlie1nwnCBp60Ax70APtuQ2MyX5FkyHbGfMvRqfLVMTk/vj37GB5zn
         Mj0QSyAYsEgNZHEpbeGg7OpkxTPJ0uHsm5FsuVCv2Ct0MTW9a3vRpP8TH/jllRSU0Gdq
         k7erXAvWdALrjGVN82Vw3AyzjVREDwvsriDSTi+qjb95kUBtYZyYkI9vUtu+llwkV3oq
         LQxY0UgtcoYOt8xZRtA8rtXCkwmuR4wccX4UhuanMYgrSH01alJKlxbPdKc5+3IkvsPo
         SdwD8f9fr4MNRs42Uwcwr7RaIHkO71EC8NjPtxmApPp5elU8Yxt3xJAOuWLeCdWMklc+
         SEcg==
X-Forwarded-Encrypted: i=1; AKwUvByThR73osGDwarucVaNha90i8CqUJmW/NQYQ9O2A9TWXr+aQ69KK1+6Yi/EnF4YwyIV3u08ljm2W56Ui78qjwX0@lists.infradead.org
X-Gm-Message-State: AFq9FYJe9U6DexL0YurCkP/OwfNQlT0G5keLNgJYQlT2AEcq2gHRvvcG
	L078KtQTrFDTykqUOSLhZIQXFl/luERXozOUj70BUdZLcd8dY8e/S0jMvqN89bzQEi1iv9S3OWA
	P+qf71xbQyRZiLaPCLTr0DaX/FYhMicYEL4LmlNEX78LspLJBRzM5cRtzVuauCl17bD2THVxM5d
	R6TgHNZ1JJjR0PmLO4Ipo6QkIhAbn0EGeyq7fKE0Ay9mYnSswhHHE=
X-Gm-Gg: AYBFou1vMG6RsI8Crd481pvirgTvsRaxxnalf0aML+MUF6c0BHrvgchMUWKat47cvE5
	exiVk4jBA9VShdBGnpkuTFshp6MIsVhwJe6BNnkDuB4iMHwmbd3DMOr04BSDvj7YInc9zVW5OO6
	JFZXeg9yfVVZO8UG9K1vrXcHWg42LHCKWOArWg5MRerfjgIrTQofNKdRAygmLCZ75SoLZtxofmv
	Txs+kdSCy5egv9+0Eh69R5TlMgwRkbmy+4tY7LWD3JLyv/5Qr1mfDA/KMjZsA==
X-Received: by 2002:a05:6000:98d:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-48dbaae9e03mr28722493f8f.28.1791997013248;
        Wed, 14 Oct 2026 09:56:53 -0700 (PDT)
X-Received: by 2002:a05:6000:98d:b0:48c:4a62:9af7 with SMTP id
 ffacd0b85a97d-48dbaae9e03mr28722461f8f.28.1791997012865; Wed, 14 Oct 2026
 09:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20261014162126.964330-1-maz@kernel.org> <CABgObfYVHtFGopM=vCY2vt2N-CON=_5BN4YFiZknwvyrgP5mfw@mail.gmail.com>
 <86qzhs1ay2.wl-maz@kernel.org>
In-Reply-To: <86qzhs1ay2.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 14 Oct 2026 18:56:40 +0200
X-Gm-Features: AclHuK9xgAQ0ZLzEzprl5qRpMX_n6sDrLGVAFdnCLrhAZow3Alf-LuTpAdZdNuU
Message-ID: <CABgObfbkbEY_MuD7Y=Y1GYSrHjp=nKfE8-Vy+QHqKMyCVurJ9Q@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 updates for Linux 7.4
To: Marc Zyngier <maz@kernel.org>
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Colton Lewis <coltonlewis@google.com>, Eric Auger <eauger@redhat.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Gautam Menghani <gautam@linux.ibm.com>, 
	Gavin Shan <gshan@redhat.com>, Gokul K <gokul02k@gmail.com>, 
	Hemanth Selam <hemanth.selam@gmail.com>, Hiroyuki Katsura <hk590@cam.ac.uk>, 
	Itaru Kitayama <itaru.kitayama@fujitsu.com>, Jack Thomson <jackabt@amazon.com>, 
	Jiaqi Yan <jiaqiyan@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Jonathan Davies <jonathan.davies@nutanix.com>, Karl Mehltretter <kmehltretter@gmail.com>, 
	Leonardo Bras <leo.bras@arm.com>, Like Xu <likexu@tencent.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Nina Schoetterl-Glausch <nsg@linux.ibm.com>, Oliver Upton <oupton@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Sebastian Ott <sebott@redhat.com>, Shen Yongchao <grayhat@foxmail.com>, 
	Shuai Xue <xueshuai@linux.alibaba.com>, Stefan Teodorescu <fane@google.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Steven Price <steven.price@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Wang Han <wanghan@linux.alibaba.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Will Deacon <will@kernel.org>, Yuan Yao <yaoyuan@linux.alibaba.com>, 
	Zenghui Yu <zenghui.yu@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8ttZ5KeJ6YzrBaEFYtE9qhYYO4Bm5PlqIB7QOfQc5U8_1791997013
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_095658_508704_36E2A95A 
X-CRM114-Status: UNSURE (   8.37  )
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

On Wed, Oct 14, 2026 at 6:52=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Wed, 14 Oct 2026 17:30:50 +0100,
> Looks pretty good to me:

Good, applied (I idly wonder what the x86 maintainers would think of
KVM growing a memory allocator...).

Paolo


