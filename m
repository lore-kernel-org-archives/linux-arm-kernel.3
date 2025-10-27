Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F55CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTyXAmu6h8p0aUgPYpkn5R7UxPSmEWLXG8jASemzHPo=; b=FlNimeOHLAltuGGWl4gAvTNMOn
	VmGhwtA4Aa+a2r5frPp8ElvqbiKYhno3v3dghXGiRNfaeXm21onBQ1YtPbDLJYPa0MkaUZs+oF2BT
	JiG9sHU5htf9O2SihgZfgw71u0K7XTJ2dgYA2qMD4YlLEpGTLcyrtEZ0xIOSFE7PbmwrQ9n3725vS
	Xz+SrJlZYva/a40PK440K82zMGniWI/Wi3EyhAzhNJsnik5oAOv5L+1wXs9k4SE7EHHeezcKDbUB3
	Neh9uWyK/Flj1cYwAw/+L53XFoym3sYiPb3sDTH7DZ4n0mq68yV7kvZbFotepfFO5Blf3OE7GaILw
	dj0/qBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRS9-0000000EUrA-0pu9;
	Mon, 27 Oct 2025 17:56:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRS6-0000000EUqm-32l1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 17:56:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so35782975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761587777; x=1762192577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTyXAmu6h8p0aUgPYpkn5R7UxPSmEWLXG8jASemzHPo=;
        b=KJxU953zNMr8WUEDumrCb+ub+q75RKkr3QTCdwEcqdz3hC1ppSTtfBj90Xz/6n7IUp
         k/+v+nX6vnPrNScePbYjAI2wU0WurxZS3MhuwKJWw8u8fqrFNPIv7AI9M38xg++wm5fo
         BjvUBzCP/a8kHIEfqnzD5nxWv3fYh0oriiYuPliNwzcwl39c/1c6L2FvSimkYuuZO9Km
         gCgVdxQLFKT3g3fHaj2Qmf+XxMWIEks2Z241WIBGo27wEHjt9YTB52jPoBtdosw/3AXn
         XkpCZmFyacvTgNJ33uxQe32aNKsMvPDg5MLoo2iHHVDKQUjM4uNWlo4Dd28LFpfGgMWL
         sR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761587777; x=1762192577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTyXAmu6h8p0aUgPYpkn5R7UxPSmEWLXG8jASemzHPo=;
        b=IeszDVhWV8BB56skZLd6GN/OWBGUYYAO+vh/InDyOAaS6XDFU0emYIhPkUSHTBAUok
         LxwuWH/gAwlVBVXHsyBP2Dbem95XrBt41Lqzb2JmtxaWGuuJiShifdpYXfTFvbcS6SSW
         6qipVMYekj3r3pQbFf3Xa77qU3HQE+ipDHJEaeVdmrZaFrgMX7NaMWefbxq8AqXjcuYF
         q+GwiBXF1AMz3CgA20Z3tgYx5kvIlz+Css/wi9qrdG/JoLfxLcNwYoksoc2rCjN+XOF5
         WL+UPR+PvuvrCrO02420n4sxP9bJcA/3H2I94W49uQ6Q5orImbUDGidfeil9f9OACUU+
         Gnng==
X-Gm-Message-State: AOJu0YxHWgRByfkNQLyvIeH1xWcSCSwbHCbbyjfinKzWr4W0b0OhPBsy
	K0ERMz7DJvbYbqITTlPKb35Gmt3YTQGMObTnWdWiEU0ag7wj23un0yz50lFRCw==
X-Gm-Gg: ASbGncvk+FUAw7ZfU6iao+82u/QjBnSLEaXFq4VL2vfH3f7KZlSfnTqcthGOZ9z/e/S
	n6ozyKmYwaGX8p+1aSppg04kWUR8bWbbqM0oYpc62MWmLSlYIl/3vBVE5RztQt02Mlaq1TGFMxF
	bdeHoEw+ovgnECwonExkIB7tlhrKREyVrT3xGUEanz8VY9o3/t8e3UiVCmcxKSInNIHCr/Cdv1s
	Kmmy07Pf9IuiTF8+Ikbm7XG+jdmdRxrb/nZjYUca6nrpATUYYE5EvPjvXFhN/P8sCQbR2jXvhG0
	Bv/tREwS1ZHb4MoZW4Zfb6bHEvCqw9ik9GfO+URSa70diUvylah9kHaXKol6wMkrkV7sX0T8d0c
	/1OYMTVesvTF71mmEMbpqV9Mivvdy1DWYckCTWurU1XDbtH/RIC/dM9d2nRR9yp9zNoqHWMg8m7
	0NFxRBEqMqDo0+uXyz3ZuHqN85c5u0i6yuKjthrTAbeZSbwtZcIneBbje/LF3k01dTq5ModsSdk
	7xsAg==
X-Google-Smtp-Source: AGHT+IGLlw4i5A56qdLTkfeHx+BuS0U50SIVfjOqfOSi6b+A2jTY4TxAjYbyLaxVW5BAGIINTcSj5A==
X-Received: by 2002:a05:6000:3110:b0:428:56ed:c68e with SMTP id ffacd0b85a97d-429a81b117fmr275475f8f.9.1761587776413;
        Mon, 27 Oct 2025 10:56:16 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475ddad455fsm74789945e9.2.2025.10.27.10.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 10:56:15 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/1] bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy()
 calls
Date: Mon, 27 Oct 2025 18:56:14 +0100
Message-ID: <12766665.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20251027133359.392984-1-sakari.ailus@linux.intel.com>
References: <20251027133359.392984-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_105618_789447_361806E9 
X-CRM114-Status: UNSURE (   7.19  )
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

Dne ponedeljek, 27. oktober 2025 ob 14:33:59 Srednjeevropski standardni =C4=
=8Das je Sakari Ailus napisal(a):
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



