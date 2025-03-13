Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A128EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 13:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PLsvEgnbim2yotRJtm3RxSyGerYXasNwsqr+/KVpS4=; b=2cbRq0QFfH87HXgzA6YBA80tcD
	z1X7uWZmwZPXDXiHjItrTniSrzXUYJpNRFOce7G7Gr2xOaJZin0OO1wwXxAY2TVM5hlyry+wDpRjC
	IK2Y/Rc17K0YRLMYvJsJCLagrsQXfrwKDsCsVES3PLDj69j/9y9jTk4XLoOhb0/qwsf0nwF7/1Q8i
	CA+Nh2OOygSlJpl3c3kvdFcGtchgv4+DAjDNLcuux3v2tBjQ+vUQx63GabC8ivJvtYhmQCI/T/QrP
	qah1i+t2hsjrP2n+kGeb5SLMqwQ7GWTcAx6fPhwVgzKCWZLp+4uG5IFqCNGsTEFW3KY0LVklYLxqA
	UR4b+vbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsib6-0000000BNxQ-2utK;
	Thu, 13 Mar 2025 13:27:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiYI-0000000BNX5-0kyY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Mar 2025 13:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5PLsvEgnbim2yotRJtm3RxSyGerYXasNwsqr+/KVpS4=; b=pnQwXjrdSemCrpI3BOL5VeIbDs
	ZyScexNe+MmkkbbGar8WGz3CbpAMtCcprzB2rRaKAZmz4LEU90RU0uGcZRWt1cgudHpDMby/XVN1a
	0+fQ5Y9zJaPIDxGWCKLJRqAkqYL9yGZKkV70xIosWbi3ztxqyZHSqL10d+2pEK128cID5GKdb70qs
	nfAPvx2U2RuMUSTMhIpTbnRExXHHjAfOb73itNSTehloNpShD5j6xrgdi0kDEqWsoetNvzb5fSGDZ
	BVjmD5dXRiU/OBEiSTh6FO4Mu8C79LAcBTLkPBOTEumubr2k2+INoy1itPAA84v9zOAXFBJTZHfWk
	E4HbXsJQ==;
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiYF-00000002dmd-0PYO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 13:24:45 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-85ad83ba141so95367839f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 06:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1741872280; x=1742477080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PLsvEgnbim2yotRJtm3RxSyGerYXasNwsqr+/KVpS4=;
        b=FHH3rBu+c66uuJfWnEdUur9/6DS4maRNYuMb2tphYFIMjMg68aB21Ml/uX1RjiNpPA
         GpTd44KCarD+aY32/KvY73M+5VgR0Bqx4CW4vR/ZVzHSsuXId1xp8SyrpNH4FwplUIX6
         bDVTfumxVSMqDafe+srQLfdl5zI69jfaXe/bm8K5ZrCS2zXzSAAntfJLxNyb/xFUTvH6
         vvpxFrh2z6h0RUS4/aiOGL+yC84weviFPytOfUMnWsEd7EZ+vPhH3T+iwhiZgyS63Rv+
         Rc208hMd7EW7wUe0zd+sOTQd9nhKZtzjVwvby/2s+l0IzxJoXj3Nvdm+CS4wYMyt9J4C
         K2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741872280; x=1742477080;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PLsvEgnbim2yotRJtm3RxSyGerYXasNwsqr+/KVpS4=;
        b=OfVHPvxu2itC2zcx9GtX0kJNXB747J56vIGDWTPakpUxu4SXFm+SYQz5EUXrnFmT4Y
         efs7P3RWBaQOmo9+XbepDPMIfr0IpXYqFOBNcbbbBYoBApIYt0ZShlaehQDzZ+YcEtos
         qq5Gw/89BumEjq3xVbmRkz5ir6MXyFONKByEb1Rp2xM4w8Kv1FcoXbGqY9lfr9ooU7bq
         snkB5CRMZZfEXTrNJvAKaGo2oyGW/2HplalwdSW3F32/92MSAId3qylVGoLPlcy2O+o0
         j2gXQO/6vHIhWU5cY/heNKb3rILEY38tgK91nHc0QVHFiMo7ODiFMtBBC7z7GpXBr+nr
         m0uA==
X-Forwarded-Encrypted: i=1; AJvYcCVgVsjACUV92IB7BWF6CToDndea7MeyrA9EB2SosXEqSjNCW2kuCLz66bb2S52lRDjsMhNUM2I0c6PCqlV0vo9T@lists.infradead.org
X-Gm-Message-State: AOJu0YxpdurAeQENpcBbTC5LEg99YuDmcDrYsL96Kadwfnw/82u4qGJT
	hsHiAFuU3Bri/rnicFD4PYPGx/I42MkwvNlDVjTl/7FsEb+EpqoGCx3dwKjRBNk=
X-Gm-Gg: ASbGncuLwY3VIQJ+BSI43eH74f9CA0fBlqq1kOaQaGY8wovxxiSWHsuaGlSj0Nkj4SM
	yPx5HmeOH5A6A5Sz+f/NYCGrbxtJ5FB3NbtQ9rbG9zu0L/+BB+VWL5ie1l1Pt04CPao7/m8IhQM
	w8lS92Qy+fN1Dtdyd5GD5l4W5nyabNl9oU7LOr08Qe06we4lT8Y19eTlMJQEi8tbo4KhJroZcQR
	+Sc5ggK8d5Nagwzco43wBQrEoR098jp35OdmIeoEVb3tVhjxxaxza1kkQTs/w9EH0rUQetvzuHt
	iudu2PqHeEdGNvSrC0CbmylIW+q0tSLreHE=
X-Google-Smtp-Source: AGHT+IEer637uehs/daevOydns9iUer0NF8/Lop3Ui7LDoPjH6cMpb131IF3qkXQqxQNFL57dNEHAg==
X-Received: by 2002:a05:6602:380d:b0:85b:5494:5519 with SMTP id ca18e2360f4ac-85b54946d71mr1891701439f.5.1741872279762;
        Thu, 13 Mar 2025 06:24:39 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85db879e512sm31580739f.28.2025.03.13.06.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:24:39 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
 Jack Wang <jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
 Chaitanya Kulkarni <kch@nvidia.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Anuj Gupta <anuj20.g@samsung.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
In-Reply-To: <20250313035322.243239-1-anuj20.g@samsung.com>
References: <CGME20250313040150epcas5p347f94dac34fd2946dea51049559ee1de@epcas5p3.samsung.com>
 <20250313035322.243239-1-anuj20.g@samsung.com>
Subject: Re: [PATCH] block: remove unused parameter
Message-Id: <174187227786.18244.14269218969550436496.b4-ty@kernel.dk>
Date: Thu, 13 Mar 2025 07:24:37 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_132443_388572_7DB28DD4 
X-CRM114-Status: UNSURE (   8.89  )
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


On Thu, 13 Mar 2025 09:23:18 +0530, Anuj Gupta wrote:
> request_queue param is not used by blk_rq_map_sg and __blk_rq_map_sg.
> remove it.
> 
> 

Applied, thanks!

[1/1] block: remove unused parameter
      commit: 61667cb6644f6fb01eb8baa928e381c016b5ed7b

Best regards,
-- 
Jens Axboe




