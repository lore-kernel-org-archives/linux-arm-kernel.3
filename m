Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB65C36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RF8P2fQ10v5Mu3r/Mhc2dJvBZ87IzW55kG0TZCm78I=; b=ns85zTPj4jt32lrGTjYUIReQox
	cQKQopK8VdwewkyQLUc/tCdcGs+sHJaBtE/Qvc2P6jNsePN3hbfP2f1XQrqElP5DWaA2nDKsG8hqq
	/37zt3luufSFUSSDdBB+3pfkn/bkU3QziOvT9P/VAupKd5cTPlerA9Ordd9QF8sMQUVZIZ7Bq4j8X
	urz3u28CP/WSeQ61Lfjf8RsKBePK2/cEsS+7t/YdjxRtlGi7rW/MMaydkaZjli5N1tKDeaZBCFKYC
	13TZnCv/JCdWaeBk3gp/ClWLu+C4KhIhG4VoQvM6j0/QzbsFFAD9CknF4yDrzycouOSjLZdVulvtI
	QmMuYsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx21-000000062fH-022Y;
	Wed, 02 Apr 2025 12:17:21 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwyy-000000062Gi-2Eg2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:14:13 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so6562190a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 05:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743596051; x=1744200851; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0RF8P2fQ10v5Mu3r/Mhc2dJvBZ87IzW55kG0TZCm78I=;
        b=dOtLIgH0tQXWXx5uujoAr4GOjuS9SlQxsDZ6WkyVumCrTaxeBVq0IT4dtcylXziM8s
         qf7QLzvhxJVqecFkx5WMGgRIDuMHlYjWHLWbnItUYfp54Xy3HE7O+QCtmqLTmtfuBZBL
         EpeqzW5Zjz9HzhfOk/XqDfkYXzC+FV+qy+JD+cAnnf+duxudINmnZhIl7rhcQ/x9zyJ2
         YgeiFBOs9v+sX15LAs2S64xd35AqpY4Urlss7LPQcyROHh9wyVbEg4x9abjZgCuBq4QQ
         4KpZqzV2kPZaZl1eygcpdl/OeOxB5X0CZnxVjHkGv/LVOk9Iez5CbAqWfR6Tmuq9u2Zu
         fXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596051; x=1744200851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RF8P2fQ10v5Mu3r/Mhc2dJvBZ87IzW55kG0TZCm78I=;
        b=e8gp2t6iHSat4EH6+r5dxmgkhKMcQTEnYZvoIU5upETnAwCOPHQ5LC4ccsTML61b5s
         qwKV3LbMiWHI1xzFP9F4+3HgBS3sXke3+irVEMeEJGorcxplvQrUhunaTeTXxAZt1G6L
         fl5XGHxzLaHSw1m7B3WRVShrLY+X+FhT1H/Md3p3dB5refbeMJTiOchmoaR88y6TzNRE
         AycSIXRaWI5Z/lhOGMxBSw7KCOEiD2VImy80wQup620kzQGyxpRb2tU8OVCuQBwZpdgy
         xmxt2vDUfzzQl9Ct52KVVBjf8c1Mx8w1rAztL5R7LjnXMa6WIEkhjGDiBPDxvrZpiwZl
         a37Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8ZlrKtcIkmwSgL9Zj815B/KfJLKfbfa/urA9DUjbPyNoEwbUl25DJ+78ZYrucZoPGeT+F6ic7AF4zeJW19NZL@lists.infradead.org
X-Gm-Message-State: AOJu0YxNML7MccFz0R4w0xUbMsOzbaoirPmytDDbA0QSH0J3jZAmT0JO
	vRupRrwUqA13jaKfVeVNmvnsi97EuaCwJCWyXkdwwI1+5vq/T3FMBlzPi/aE54Y=
X-Gm-Gg: ASbGncumA8kovtiOJTt5bXJYbvqgPhJYWlb+6Wf8UnLoDPoyOkjuYUiWeESr54j0q3M
	LOHxVgPq8NF56TyAZFfqrtO7jvcxZEwqso3A21NVWps9lKKKjJJbcenFJIu4iCXJDDQf6b/SA5h
	AA62ctJRj+g/3ONp721FfFaTJFkKWNyt36crG1Qrp++Q9O5yRJrres5KeeV+OAlQf2Lmu8oOP2Y
	FvebO/0888IqOa0kD0+rXWKhUSveJ7FPS4uMOXyiwWJVPOmXM44j5C3GI7+xQ4B8EHfWsRJ/b/p
	AZQAi1Ha7vPBkuU9U/gsxJzTOT+wwtzjU9QRWRovJJ2MtL9VnKuDDtLsMQ==
X-Google-Smtp-Source: AGHT+IFhN7ZAH+G1AHFfH3MH4k5x3f1TqLcvN0a+YR/UIadUZIfx8NGbQyNbcqpWjfZSWJKm7IgeRw==
X-Received: by 2002:a17:907:3fa4:b0:ac1:f002:d85d with SMTP id a640c23a62f3a-ac782af6f36mr539762166b.6.1743596050524;
        Wed, 02 Apr 2025 05:14:10 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7192f0adasm900648266b.79.2025.04.02.05.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 05:14:10 -0700 (PDT)
Message-ID: <e80b80e0-b4d1-4d10-93c2-924293f88526@linaro.org>
Date: Wed, 2 Apr 2025 13:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] coresight: Dynamically add connections
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <3b026b3f-2cb2-49ef-aa20-8b14220f5324@stanley.mountain>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <3b026b3f-2cb2-49ef-aa20-8b14220f5324@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_051412_600650_C83D6CA6 
X-CRM114-Status: GOOD (  16.48  )
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



On 02/04/2025 12:00 pm, Dan Carpenter wrote:
> Hello James Clark,
> 
> Commit 3d4ff657e454 ("coresight: Dynamically add connections") from
> Apr 25, 2023 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	drivers/hwtracing/coresight/coresight-platform.c:279 of_coresight_parse_endpoint()
> 	warn: inconsistent refcounting 'rep->kobj.kref.refcount.refs.counter':
> 
> drivers/hwtracing/coresight/coresight-platform.c
>      196 static int of_coresight_parse_endpoint(struct device *dev,
>      197                                        struct device_node *ep,
>      198                                        struct coresight_platform_data *pdata)
>      199 {
>      200         int ret = 0;
>      201         struct of_endpoint endpoint, rendpoint;
>      202         struct device_node *rparent = NULL;
>      203         struct device_node *rep = NULL;
>      204         struct device *rdev = NULL;
>      205         struct fwnode_handle *rdev_fwnode;
>      206         struct coresight_connection conn = {};
>      207         struct coresight_connection *new_conn;
>      208
>      209         do {
>      210                 /* Parse the local port details */
>      211                 if (of_graph_parse_endpoint(ep, &endpoint))
>      212                         break;
>      213                 /*
>      214                  * Get a handle on the remote endpoint and the device it is
>      215                  * attached to.
>      216                  */
>      217                 rep = of_graph_get_remote_endpoint(ep);
>      218                 if (!rep)
>      219                         break;
>      220                 rparent = of_coresight_get_port_parent(rep);
>      221                 if (!rparent)
>      222                         break;
>      223                 if (of_graph_parse_endpoint(rep, &rendpoint))
>      224                         break;
>      225
>      226                 rdev_fwnode = of_fwnode_handle(rparent);
>      227                 /* If the remote device is not available, defer probing */
>      228                 rdev = coresight_find_device_by_fwnode(rdev_fwnode);
>      229                 if (!rdev) {
>      230                         ret = -EPROBE_DEFER;
>      231                         break;
>      232                 }
>      233
>      234                 conn.src_port = endpoint.port;
>      235                 /*
>      236                  * Hold the refcount to the target device. This could be
>      237                  * released via:
>      238                  * 1) coresight_release_platform_data() if the probe fails or
>      239                  *    this device is unregistered.
>      240                  * 2) While removing the target device via
>      241                  *    coresight_remove_match()
>      242                  */
>      243                 conn.dest_fwnode = fwnode_handle_get(rdev_fwnode);
>      244                 conn.dest_port = rendpoint.port;
>      245
>      246                 /*
>      247                  * Get the firmware node of the filter source through the
>      248                  * reference. This could be used to filter the source in
>      249                  * building path.
>      250                  */
>      251                 conn.filter_src_fwnode =
>      252                         fwnode_find_reference(&ep->fwnode, "filter-source", 0);
>      253                 if (IS_ERR(conn.filter_src_fwnode)) {
>      254                         conn.filter_src_fwnode = NULL;
>      255                 } else {
>      256                         conn.filter_src_dev =
>      257                          coresight_find_csdev_by_fwnode(conn.filter_src_fwnode);
>      258                         if (conn.filter_src_dev &&
>      259                             !coresight_is_device_source(conn.filter_src_dev)) {
>      260                                 dev_warn(dev, "port %d: Filter handle is not a trace source : %s\n",
>      261                                          conn.src_port, dev_name(&conn.filter_src_dev->dev));
>      262                                 conn.filter_src_dev = NULL;
>      263                                 conn.filter_src_fwnode = NULL;
>      264                         }
>      265                 }
>      266
>      267                 new_conn = coresight_add_out_conn(dev, pdata, &conn);
>      268                 if (IS_ERR_VALUE(new_conn)) {
>      269                         fwnode_handle_put(conn.dest_fwnode);
>      270                         return PTR_ERR(new_conn);
> 
> Should this be a break statement instead of return statement?
> 

Hi Dan,

Yes it probably should, I'll send a patch.

Thanks
James


