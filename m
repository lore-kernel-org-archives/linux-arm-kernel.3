Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06553C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdCpsV3oeBbM/txrF6zviMQFbYf9Gv0D67sVl5aM3Fk=; b=yf7Qzqmwf+6itMp2wWDTtnSWp7
	yXT3hNrAl/FKnNntmY1A+HEFqzMo0ILXjKmXlofCk1ZHONititcIXv6ddy6lzc7UOFnAqSamVzAtS
	3tJEQHfaP+talCGZjdFHJt9G1s7+Yj3XqmtUz/mAb2Xj+Jo/VX06a4BKCtPqdLPjMF+cLG7ADaF4U
	GS6eZdnACCqhQed6hWuuqq3Ux5/bHYgVLCNzFFKaewH9VQbwL/UCJwzJoqZkY+j0V5p+rivrOYrcJ
	vwAZ2KNW2WfQ2P/WtThq6eH/fPGG+kV9qI3JnGDsdU2jrZ6W+FLVrDL7C4SybU82ZTng00SzntkkJ
	Raait67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y7y-000000057BG-2hly;
	Tue, 22 Sep 2026 10:53:34 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y7w-000000057Ai-1Zsh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 10:53:33 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469a3490bso4142704b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 03:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790074411; x=1790679211; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdCpsV3oeBbM/txrF6zviMQFbYf9Gv0D67sVl5aM3Fk=;
        b=MfKKbV33TWpS6k5TK+KZRS37zTM//acECo7GibU+ny92zHhAzLUBG0C16ovu/Vf984
         7QPUaxWAltpOfXSpCIQIJisRvf7WRGfZaI1ahcm/1rOxknmLgbo0DEoGP5t6GuVZ4PXN
         eyQgSzMexgSsjkCnWhp8kD/eSE295GesZ/p/ZNHbHJYNquBXkLRaFPwWwt8/Fz3O0SQ6
         zwQsF8NjrFDRl0N7CUipZkpNi+kPCXBi4VrkXmj8LKNFHSezcA4kwNT50BQxE8bec0jp
         1ced27op/TE8OsRuPuG1DMSIUpBh6DNOAEQRGh0GgbGGMwbm6uUr0dImgWSmWk7mB9XS
         Ux4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074411; x=1790679211;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdCpsV3oeBbM/txrF6zviMQFbYf9Gv0D67sVl5aM3Fk=;
        b=k66jKlDrWwsrY6bw4XHLowwuYZoI4joJWw/kExnThbPuQuZONzGnEHF++m70R3xdvs
         Vh+rp65WWP7c0vfZN/Kt6xm0IIIUzJXfsdez+Cvq5wIbckXlewJcVfMEzrxF1GTcWUlq
         mk08YFFIQ+yD/If9jMi3CPgD+Z4dOx1zs2p3nZfR8maZqZaAK39rOeErJCDNr35tY9Gk
         HL/evymiKUCeE02RC5ft7iWQlnR6ouM3DUnvbm2i6R8ichl4tMQnSe2POdjCSqUHQS/l
         hnSZAnry423sUSzryIsCQA3V5hyU+x67bN4xyxHjGRm0RQo5E8BtvA+SqYURENUIbSS8
         CFSg==
X-Forwarded-Encrypted: i=1; AKwUvBy1dEX3hUJXAc3OWNrckNqI/nRyB5CwrxPqeT6s1/oa0oiJ6G8WCJZLfrhn2rTKunOBLqXN+00+maVHixbA4tGZ@lists.infradead.org
X-Gm-Message-State: AFuF++nrwLD0pIbKMIwbN1IHTkWvQFiI6Ba7UMqPK3N8wLmNZVMLPsHH
	ufZd9jAsmeMtS3+i8qWQo0P6ejj85kcXp4N90uh1YB5HkrSAx6As5/1v
X-Gm-Gg: AYBFou3ZqVaB/rcfVQ5Oonyef0nl8GxmbbX/kuklA1at+nQZ6SsCDwmCXYyv/eDP0gK
	c8wnc1TJXx02EaEEFXWo/nzdwRIguo4oYygD5wxxlVUTxx547Rr5tGylsZeBLryGnxNO/IsqDNS
	W02PZb3zDIgw83edk1ZoURSbThuEBTIA9RXq6kWAJycsVu6hdSAnoOe8L00lA98eM3jCtRUtvsh
	iQMCSNMDtzM/5XLWLNwQVnlfbwYjg3H65nM2mOaHaPxKnl4qHs1rFTjrHvXYXxl1AbyklcFrrIn
	VNv8pGg3Ogmm0NFvlvmKTdVWgH8exiX50rP4Sao5rpZD7ARbPyYohepuMJBOWDGgMtumfXZRPyv
	8KGGvPlWxV6n3ir+2e8/nh2Dz/+lshnM1rt6ZR1+7MdNpv7FPh39Q8J08+X9u8tNiMFkerFYdXv
	bWVuBqdk4SJkMlontEJ5capkR2xXF9FmHvZh+aEvZg/lG3XGIade9/VC5wd/v0iFMfuUp0Ou9Ck
	Lbpxrl/zsg4UoZzDeYenLIQ86pcMcxdOp4xe58=
X-Received: by 2002:a05:6a00:1743:b0:879:ffd9:1282 with SMTP id d2e1a72fcca58-87c819bc726mr913524b3a.8.1790074411386;
        Tue, 22 Sep 2026 03:53:31 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:e5f5:eb9b:fe8e:9197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87cd584f183sm2302b3a.41.2026.09.22.03.53.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 03:53:30 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	sashiko-reviews@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: Re: [PATCH] KVM: selftests: arm64: Add test for cross-vCPU LPI disable race
Date: Tue, 22 Sep 2026 18:53:22 +0800
Message-ID: <20260922105322.40484-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260922102959.41FFA1F000FF@smtp.kernel.org>
References: <20260922102959.41FFA1F000FF@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_035332_417787_EBBBD638 
X-CRM114-Status: GOOD (  10.77  )
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

Thanks for the Sashiko review. All three points are legitimate; v2 addresses them:

1. INVALL/SYNC on unmapped collection:
Agreed - INVALL for collection 1 was a command error that stalls the
virtual ITS queue. v2 only sends INVALL and SYNC for TARGET_VCPU_ID
(the only mapped collection and the only vCPU receiving ITS commands);
unmapped collections and untouched vCPUs are skipped.

2. configure_lpis() overflow via -e:
Agreed. v2 bounds-checks the -e argument in main() (must fit in one 64K
ITT page) and adds an explicit assertion in configure_lpis() that
nr_lpis <= SZ_64K to guarantee the property table is never overrun.

3. Silently ignored KVM_SIGNAL_MSI failures:
Agreed in spirit. Injection failures are expected during the brief
window where the disable path has invalidated the ITS caches and the
guest has not yet remapped them. v2 counts successful injections
(checking KVM_SIGNAL_MSI return value > 0) and asserts at the end
that at least one succeeded, so a permanently broken environment can
no longer yield a false pass.

Additionally, v2 re-establishes the ITS mappings after every
EnableLPIs toggle. Without this, the disable path's cache invalidation
kills all mappings after the first iteration and the MSI flood goes
silent - now the overflow window exists on every iteration, matching
the re-initialisation sequence a real guest performs on re-enable.

Tested status is unchanged: no KVM-capable hardware available, so
compile- and TCG-plumbing-tested only; no Tested-by.

pw-bot: cr

Thanks,
Yuchao

