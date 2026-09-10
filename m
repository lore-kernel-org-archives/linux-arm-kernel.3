Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3784FC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 21:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zC/TwPpzsaghSj/8QRD9k+IasDdKbL8GKT8smkkknMk=; b=ZUTYmrf50ZV0tGyI850uu1nmE7
	kgf6JFkDg3JbL1KJB9QUP5BWAXx3F9vdzLkkZi+sp8TruKA8sTzLUkNUNO0M59IU2O3xmcmmi/y12
	mR05SN2E0pxXiTRVbrhukTxejSOl/QWc2OGVxvpMkmFgFdjZNG6G1E4myw/fQNmIzL54x1UEZyaec
	SqSymqZE2CD+xQb+OxyoZXQYWbP0f6Yr1iCffa8UPVk/GZOzHKb7KYvQOduWvgHWYjrNiNuiqqLuG
	Ez6HgN5Z5lZ8sZiemRIfDsTMFMzL4J6rCFP9P3Z4O5odm0I6IUNB0Tu4710X+oatpfpIVVBBexbaN
	BrS9aUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4lye-0000000FOUJ-2lH1;
	Thu, 10 Sep 2026 21:06:36 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4lyb-0000000FOSq-2DyS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 21:06:35 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so199199f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 14:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789074391; x=1789679191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zC/TwPpzsaghSj/8QRD9k+IasDdKbL8GKT8smkkknMk=;
        b=XvF32akUcmrWKIen3+UMqJaxy7L1DZqcOqUjs33csZDrKlIdnwAAxYG0oRPhfjS0QW
         qaGWEXpvhREJL5wnLIK4jX97N2h2DbtEDn6RLlKPh9VT1jZ1MAQgFpjUEHQ3Y2QQ4h5B
         gYkiDDGHyJMYSCtKSQAG828Kk0Bvr84QCVlq6aV9na8Q/GTM6Voxd4NOrSuv//o2OEwu
         UdDNv9T7qqS4j4PgWBhYotbJBVnvvhYMtajYVtln/Taxoj6Ii1NGT8EiAmkNBj1zhJvQ
         DIQ3j45aas2eYMU8GBJXr5P8q90qj0vVn6XiUIGxZ51bTyx9X1sSH60KfhoqPU+porZL
         5wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074391; x=1789679191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zC/TwPpzsaghSj/8QRD9k+IasDdKbL8GKT8smkkknMk=;
        b=nzZIzfx6zZIi68cgOz5if6y1tsJ8sqQFj1l3+++fRQY+Ngpzed8rJ3zD4Pa6Xpy+zq
         vJHOSVXBM7soU2yXI03S5BjRqeIrKkT//DJvWeAjt0K+5pDyxi8i8QtmSFbhAFo/zPmG
         +zg5QrYNKxLtfjzCzm0S6yiYMcRhl5Ux8EVN4dfrzIhVEWBvTJjJ+jHLW7j2mDtXRDCm
         KZKqIgcUqq9Pdr4Jgv4hCv3ouJxitQcIQgjPfgEL/wU3I6vl0IBTtjeAqOhYEFM1vF1t
         S2PehGZbRgTTTleFJSc7ztA/+QxdV+4TroHYldDbfO5Ud6tto2T3mHhgksc9P82nCvkF
         xwMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJofFXU0RmrMac3c9SAMq41J1soo+pu7DL38FIAdLdtjc2V/tGKZOkFtl3ev3UpNXNXreA3YU6ZGjgMRJfVa2o@lists.infradead.org
X-Gm-Message-State: AFuF++lC50JTNEZD1YBQA0EZbQ8psrSJGwl8Y3dqWNmvzFIuQ4JZzdny
	+KtzusVtOIR/VcU+aLDfhFyPZAflumMD9pflDhVW1bZH+e10E0iW7hk=
X-Gm-Gg: AYBFou1F+Z2816UK1IB3bcSzb/ypNRVqcNTKO5oTQwA0hJn+EJUYOgdOfJi1wsUi9J9
	+9fiKPam3qAFi6ZK78+j+fMy7KhG524qOtox3GhUw873Xg4FlRFSTZMfdYMH1W28+TVdQXnPnG9
	khZYygPDQVXjUmvD+5AyZhQ+m+smXva+g6RGY86D9mdBJYat/TYnJ+jGd5dM6bRX5EqI5579Xn7
	9ZnrMfevVOTen2JC1k4EOXisz4SYAQFRNJSXN2cNBHWbGrtOrVsBM1CSIctSRSewz6ac5R097wu
	1xnFn2bg737blkNqOblRreDTnHcwCAccIjzO5nqJtmoqbbvyEALz77GKT9IL8WydsSIoVLiV4TD
	LcsYUQxL5hC3Dx2jZhxCw0pMJGE8VbknQuV1yGLZK2sv1ZyWyRHpYdjnnAi+YNTaA78VeHdj1IW
	3zXkJXgPaSYzZM/N1wNyk6Ao9WrzZEzIP/TAgntYRcSFFu8PK8ylHn1tz3XBuzqV1rDnHXhHyg
X-Received: by 2002:a05:6000:2f86:b0:486:e73e:abe5 with SMTP id ffacd0b85a97d-486eb2e269amr1118040f8f.10.1789074390922;
        Thu, 10 Sep 2026 14:06:30 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm1196375f8f.13.2026.09.10.14.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:06:30 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: Re: [PATCH net v3 1/2] net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
Date: Fri, 11 Sep 2026 00:06:21 +0100
Message-ID: <20260910230621.730983-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903173355.62780188@kicinski-fedora-PF5CM1Y0>
References: <cover.1788286284.git.sochnev.v.74@gmail.com> <17f1beec505b87a4acf16557386a978c98f94b97.1788286284.git.sochnev.v.74@gmail.com> <20260903173355.62780188@kicinski-fedora-PF5CM1Y0>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_140633_576816_4F090F05 
X-CRM114-Status: GOOD (  10.58  )
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

> Since you're not sure you should probably add a timer to retry
> later? Maybe the IRQ is not needed at all, you could just check 
> on allocation failure if the right is completely drained or have 
> a periodic task a'la fbnic_napi_depletion_check()

No timer either: the depletion path is not the one being hit. Please drop
this patch.

Instrumented builds logged zero NO_CPU_DSCP events across every run, with
REG_INT_ENABLE(bank0, 1) reading 0x839F839F, so the bit was unmasked for
ring 4. page_pool_dev_alloc_frag() never failed and q->queued never
reached zero, so the ring never enters the state this patch handles.
Images with and without it stalled identically.

The stall was RX rings smaller than 32 descriptors, fixed by 2/2 of this
series, e84b89f17a12 ("net: airoha: grow the small RX rings"). Details in
my report on the cover thread.

airoha_irq_handler() does discard the NO_CPU_DSCP bits, so handling them
may still be right, but I have no measurement showing it matters and will
not claim one.

