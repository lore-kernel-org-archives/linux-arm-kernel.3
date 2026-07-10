Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F7CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXLOLr+OICkYPnxLiSyxM595gWsgKFLmoYsaM3It1+g=; b=lC77m7n4M/+9DtvugJFxvw0GQx
	jL2GUjp8IjUQmb0RjwLOBT53Z6FWY4Nbob0YUplVmwWKSGYFBOn8AzPmKjJ7Q+SypLmGvGBgtkZdF
	2BMpkbQmbLfgQCRPqG7TgRAedEU6i69g51zpUdt+5Y8emCI9YoJsGpSKGqKmIYLIr2uI5HRftHPfk
	e1ZU7yQrDKxdTmmD8909CYIwKDlIdnM0GRb4TDMC5IsUDblaA/AuA8Ad8AeG0iIMmkJMbd9FsfVUv
	S71gxWk8MvLlkmd3fxCfTzg6XYut3Hehdcv/WWj2+1X/qOIKAlB2l9MWO/3WUKr98hOWgQkwqyMuH
	Xmvq3msw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIgk-00000005ou2-3YlF;
	Fri, 10 Jul 2026 21:23:14 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIgi-00000005ot1-3snK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 21:23:14 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2cabe9335f1so7795255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 14:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718592; x=1784323392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXLOLr+OICkYPnxLiSyxM595gWsgKFLmoYsaM3It1+g=;
        b=Xidv2dsJU7kiwTwG9VxSrvDCAxxTYMrPzuVsx7sCjczRIxAmNpL0sAWzC+nGE1y18E
         9V4tp896AAEZWVWgFt1D9e4hAYdgaJtS1DY4M+fQlJdorLKqsFlTiWWUZqU3GEwM77ET
         a9rN0pIUscluG72Dqu9EKX1YyUc6OyY9W8ePnQ7JUoPCCd4YqRrpgOoGudyli/2puT4a
         LkAJTWByCWms5Qzx2Kp4+dfbWQjqDlNAGxC/WYsS0ReX92/qfHeyjJauFuTSKbT/yPuU
         srXsViHBNC2MuDECFmnUQLhIODjJFVuDbiykwn/6qw0FzCTn1Unle4zq2uLcACznN+T5
         Ne0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718592; x=1784323392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXLOLr+OICkYPnxLiSyxM595gWsgKFLmoYsaM3It1+g=;
        b=J0ROlj6KTXcpF3zWRCL/U7pZJvFjS39kaAvB5QS5pE7tYDpfEGE9A1lMBG7qPttcVe
         oOCShTwNA8ihCzpg5qk5lDs1oy7HBlx8o/QxokT9iJP5z5yC19z8R6vmVpO4qX+Z2geU
         /7y7Vd4SVC3BVd1VuA4yKVHY9pX3wH51EHcrng5sVdHat/udYkBTFsv3o0QALceNrLsa
         KXYjxz7rk0SlAvKd0Dxp2zyZpaNHel0mg0A/1GVzGJa09I7sCyeLJ6Mmua8cKGyNj9ak
         Y8smttORdNGk7kq1Ad5NRukORy2eqO4wfF9baOpwTHAUMJaMU5KPED0r6yAzHGISqpDm
         yFTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOJ77R6c6zc/oAhsZgf7evoJQ5/XAD6OinPb2qluRgREKlUs80EPZ1JdwIoDOznVvLyGLMKYoxUPptTvTyPI4l@lists.infradead.org
X-Gm-Message-State: AOJu0YzkptuP84vzHig4FU46VSqZUZhmQOfrhnvJfsXgq8wb1vXke8yQ
	OGLNphE2PXDxW0ZxYTAl2WMaFyQMUTvi86z1wuolB6TMPx7y60bf25yp
X-Gm-Gg: AfdE7ckBtWIqSXEqV4rLAnciNNyk6FWSC9b1jBOE49K1MXUqcK7A7Y4qo9C41wKv73o
	lZvs6RzmjtShG4bV69Jnzr59SvgwBu1P/XINanKnCAw90NSoRcDCTBlP5po/tglcpdz42dkG2T8
	3DwXRYUGmqIi5FaxzUMdnB3hKXSAZ3IDtYjsslILmyticZDzltR4CwMagNhC+wX1W9AnkcmOjkH
	v6ZqS1koNQFjXsCOITmo2JkHTdLGmPRjpjnSB0HOm5hBItTaqsZ1gJe9vNj3e8cTLb7qhxsf/S8
	GMGB9ZlOkV0zFhnEvD8gOIUO/sEHnik/MzRJaIGaSTXH2JDVfWXZAx3SPpkYYuuISqZOhCfQGb7
	unWHssv7rLmA/Gnc87X6cgLmTAscPluLuvThkiZ3agbUa2bl7EZh4nk1NYU7j/03kzyd6yU1lKW
	mfckx33fj5TSYmHUsemYvGLfdd8ZeFU1gmSLYOdphBqOO+sQ5YxYn+cAz3E2nWZ3pCDSTXOV8=
X-Received: by 2002:a17:902:e844:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2ce9e795bfemr7461565ad.1.1783718592223;
        Fri, 10 Jul 2026 14:23:12 -0700 (PDT)
Received: from ubuntu-gnu-linux-24-04-3.hub ([2407:7000:af23:3e00:f127:785b:6e87:f831])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d2efsm65044975ad.64.2026.07.10.14.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:23:11 -0700 (PDT)
From: Jiaxing Hu <huhuvmb88@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Joerg Roedel <joro@8bytes.org>,
	iommu@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/rockchip: implement .flush_iotlb_all
Date: Sat, 11 Jul 2026 09:23:04 +1200
Message-ID: <20260710212304.11958-1-huhuvmb88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710060513.863714-1-huhuvmb88@gmail.com>
References: <20260710060513.863714-1-huhuvmb88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_142312_966431_272F5584 
X-CRM114-Status: UNSURE (   8.19  )
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

On Sat, 11 Jul 2026, Robin Murphy wrote:
> there's no harm in drivers implementing it *if* they also implement the
> relevant optimisations to avoid synchronous flushing in unmap_pages to
> make CAP_DEFERRED_FLUSH worthwhile.

Understood, thanks. I will drop the standalone patch. If I come back to
rk_iommu it will be the full version: move invalidation out of unmap_pages
into an iotlb_sync/gather path and advertise CAP_DEFERRED_FLUSH with
numbers, rather than flush_iotlb_all on its own.

Thanks,
Jiaxing

