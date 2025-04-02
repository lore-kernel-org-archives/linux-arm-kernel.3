Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5A6C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i/UulBYdiAs8NI+343jqG2cZsxfHqvbNkSfv0T3pGDg=; b=sAIIEVL+gVyg2nFJgR0ZmgFgnp
	DJWvqeVxd0jdehybq5oVvaW2akvJE9hUf7fEpSh6I+X9ttj7teYhXjtY+PxXYTozqWFCgly9LmcSp
	OAKNognYG3I65P1796ACqkFJThMLKIt6+pIdwVUH0/Q+Nk3GPZVV256NC8Wy1yBXrhrqpl6nbSQZG
	U3hYnQic0cE6wp7xAef1X7Fho2qo+SSmJDp425ueH9JILeRdSOb+ycOy/Ihn3nwj5kkRQOnu2v/QQ
	6aC1BC/FqcOveg/KV3KN1u4bJN3eg6M22yDfbTbeab8Td0ER3KgYX6pzcVrKSEUOqYGkbNDfAXgKv
	Dyfy9n1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvsZ-00000005s3I-2WSJ;
	Wed, 02 Apr 2025 11:03:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvpv-00000005rJi-1z17
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 11:00:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so4390535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 04:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743591645; x=1744196445; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/UulBYdiAs8NI+343jqG2cZsxfHqvbNkSfv0T3pGDg=;
        b=JeulsJ6y47/XoqptQq9UZF39LtK3oL8GXhGfuQ457uXtVA7xdCxn6Cjho8liCZstBW
         fgja2BFshq3jyT9CK9R7Gl6L7CihPAv77JiZgMcthWdQFXxpIUG8dSkPQu1OK/Hmo9Q0
         lIpnwU6JAZ1lV8tADSiORckUoTVIGE02yv6dT1I8vN4SIVZyebF+giPdTavqL6UCpR3f
         J3nEOO2w/eceKblSS3kY75M9umnnKUojz37MDNiA51yotB9iQZbd191b8bNV00bDge3c
         3f1cCNN03v3QXEumd7c8SUCA6UpVyBK4Sj8EyoqR8YTZQjzrEQCGKDxFtQx2VVX1Cj4V
         geiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591645; x=1744196445;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/UulBYdiAs8NI+343jqG2cZsxfHqvbNkSfv0T3pGDg=;
        b=jj4XyVauEuaPA77JUHFlZ2AF3PW/JJruhw7I6h2Gio3Q+7StBWeyJDfcyslYNabQ9N
         JWRFi+pAtNew9hXlujVTUbqlcuUKAz/ZEol3NJN2YnZqUK+wSwJDnIQM0l8qXeoEMiux
         qon9ExbxVwUl0g1pP4rDz3sVPlQZQW9Mhjv7zKnkLCp48K04za7K+qofmBPjX5iQh6yi
         lffrt+VTqVEFEexJ0K+bMgcGOfIdSC/siBRVKMtaK+rsWfHzmJK1fem0HiDmNH78iE/i
         jlu6yT439G8821ongximvxH3xL+lI8GUREUQA3+gQfU/Dx6mTmD/5Ce5tXYC9h7kMaK2
         aapQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjvouD0T2SrK/pUbAx7QSv8Bn6fIjIXXjTRWJz1jaAGr1fva4OL3uXS94/h5/ox8ZSP91bj2qL3mfnG2NCBj++@lists.infradead.org
X-Gm-Message-State: AOJu0YykqQxcBao2DgR/1pFP/UbQXeQiDrMvdGyAJj7fdvHZ4Pv12Jop
	EWxyzaVBcF9OIOn7SYf5U+v/Hm0ril6dl/ul881ghrjRPtM7haoCTTDVpn0qj7E=
X-Gm-Gg: ASbGncsowycTPRUIU02/JGl186MXXSIK8Rs/ta8Mo7QW+edhIyaFijMwWo4JYFMpeaK
	87HIDN/ZiPeJfpnCqdcNaHASMNSUnleVZgn022w9FyNNQsIY/ACSRvdq2XT1hDs3mDN2Y/opfTI
	mrlOMYbcgvO9oZqqaLKHYW/+e+sNAXk1WwQ6l1cCCYXw61OGwYtbcgIR0NLQYQOLEgRG4GSrbc2
	705b/GBCZd+XzGEEYc3IO5ZUB20RVfNRuufzw4Vv8iROhddG0PVwOMJukqg68XNFfrb8eHNIXOc
	uNrMSOKQL8efM73hegsBJeZ8m51qOb0+iu3JtjdbVU3A4IDo180bthLiChoZ
X-Google-Smtp-Source: AGHT+IGchfl0mYwka5BXBX1Sq5jgUke7KKqVrFSNCmqNY4h64bS2XE4ANLfavmmVnoTJXtdTPmUBmQ==
X-Received: by 2002:a05:600c:a015:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-43eb71e27bdmr17037115e9.16.1743591645316;
        Wed, 02 Apr 2025 04:00:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb6110989sm16877945e9.31.2025.04.02.04.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:00:44 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:00:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: [bug report] coresight: Dynamically add connections
Message-ID: <3b026b3f-2cb2-49ef-aa20-8b14220f5324@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_040047_512187_FE4C7135 
X-CRM114-Status: GOOD (  11.30  )
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

Hello James Clark,

Commit 3d4ff657e454 ("coresight: Dynamically add connections") from
Apr 25, 2023 (linux-next), leads to the following Smatch static
checker warning:

	drivers/hwtracing/coresight/coresight-platform.c:279 of_coresight_parse_endpoint()
	warn: inconsistent refcounting 'rep->kobj.kref.refcount.refs.counter':

drivers/hwtracing/coresight/coresight-platform.c
    196 static int of_coresight_parse_endpoint(struct device *dev,
    197                                        struct device_node *ep,
    198                                        struct coresight_platform_data *pdata)
    199 {
    200         int ret = 0;
    201         struct of_endpoint endpoint, rendpoint;
    202         struct device_node *rparent = NULL;
    203         struct device_node *rep = NULL;
    204         struct device *rdev = NULL;
    205         struct fwnode_handle *rdev_fwnode;
    206         struct coresight_connection conn = {};
    207         struct coresight_connection *new_conn;
    208 
    209         do {
    210                 /* Parse the local port details */
    211                 if (of_graph_parse_endpoint(ep, &endpoint))
    212                         break;
    213                 /*
    214                  * Get a handle on the remote endpoint and the device it is
    215                  * attached to.
    216                  */
    217                 rep = of_graph_get_remote_endpoint(ep);
    218                 if (!rep)
    219                         break;
    220                 rparent = of_coresight_get_port_parent(rep);
    221                 if (!rparent)
    222                         break;
    223                 if (of_graph_parse_endpoint(rep, &rendpoint))
    224                         break;
    225 
    226                 rdev_fwnode = of_fwnode_handle(rparent);
    227                 /* If the remote device is not available, defer probing */
    228                 rdev = coresight_find_device_by_fwnode(rdev_fwnode);
    229                 if (!rdev) {
    230                         ret = -EPROBE_DEFER;
    231                         break;
    232                 }
    233 
    234                 conn.src_port = endpoint.port;
    235                 /*
    236                  * Hold the refcount to the target device. This could be
    237                  * released via:
    238                  * 1) coresight_release_platform_data() if the probe fails or
    239                  *    this device is unregistered.
    240                  * 2) While removing the target device via
    241                  *    coresight_remove_match()
    242                  */
    243                 conn.dest_fwnode = fwnode_handle_get(rdev_fwnode);
    244                 conn.dest_port = rendpoint.port;
    245 
    246                 /*
    247                  * Get the firmware node of the filter source through the
    248                  * reference. This could be used to filter the source in
    249                  * building path.
    250                  */
    251                 conn.filter_src_fwnode =
    252                         fwnode_find_reference(&ep->fwnode, "filter-source", 0);
    253                 if (IS_ERR(conn.filter_src_fwnode)) {
    254                         conn.filter_src_fwnode = NULL;
    255                 } else {
    256                         conn.filter_src_dev =
    257                          coresight_find_csdev_by_fwnode(conn.filter_src_fwnode);
    258                         if (conn.filter_src_dev &&
    259                             !coresight_is_device_source(conn.filter_src_dev)) {
    260                                 dev_warn(dev, "port %d: Filter handle is not a trace source : %s\n",
    261                                          conn.src_port, dev_name(&conn.filter_src_dev->dev));
    262                                 conn.filter_src_dev = NULL;
    263                                 conn.filter_src_fwnode = NULL;
    264                         }
    265                 }
    266 
    267                 new_conn = coresight_add_out_conn(dev, pdata, &conn);
    268                 if (IS_ERR_VALUE(new_conn)) {
    269                         fwnode_handle_put(conn.dest_fwnode);
    270                         return PTR_ERR(new_conn);

Should this be a break statement instead of return statement?

    271                 }
    272                 /* Connection record updated */
    273         } while (0);
    274 
    275         of_node_put(rparent);
    276         of_node_put(rep);
    277         put_device(rdev);
    278 
--> 279         return ret;
    280 }

regards,
dan carpenter

