Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E224C606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tJ7/tYd/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d9ZLa/JG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4KseLiEBWMKMKEx4omaKpJSqCgu67BaInGBjJdgTfdM=; b=tJ7/tYd/YyMm2l7F/9Da0D/hjm
	SelB3p+mi/N4WyUw0rAmFNO5RU+pKGEMQeVzrwKnPiCnhwu0wOCYPM76NvUs09bJIBXAgOQW1zfvy
	lAiqENPTwSYX4T2CHA/WrGDDwCJTxkDDu6isE0pl4+PNy8gzN3F2K1n5a1AOxcqUsvf+W64cN15/E
	1VHgQ9C8SVj/HaSlv6/rJZB+j3HlZovvy/PTiQSdQTFK2o8PHAVsJpz70usrNHqPrf/grBhOoEtvX
	IGC9yZDQNzQ6He8UJ8v+8h8XQG4CSgid8QsNIBRr4T2SzoE7YT+KVCAr221qNJQc3zyRZF3FLYlxR
	7iEfVF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFeU-0000000Bd4x-3Zme;
	Fri, 06 Nov 2026 08:50:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFeT-0000000Bd4j-3Snp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:50:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 953BD41971;
	Fri,  6 Nov 2026 08:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771331F0089F;
	Fri,  6 Nov 2026 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793955025;
	bh=4KseLiEBWMKMKEx4omaKpJSqCgu67BaInGBjJdgTfdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d9ZLa/JGZT6or8tOKU8/O3nPYCiPkCACpZUlioB89wkfa7M18Ke/75hB8gUisOFoL
	 LtBjQijVcSaJfZtivfsR+SYheoXqCPqJiHSz3x4TecmILaqEgrxIl3bZxpnW77Ga0r
	 vNLpam8s3DvDVuyw6sxS3M+ZiNjMdybsglCyNf+9Ilo57X2hzNKJFBUS7Elr4rWPh4
	 JccxbKca5uA1e6WRMPnNNUTr4Y4JJ0VO1N5rFzGgAG/dSuHWWO+clk7Lj9vwxonKZK
	 QSX10IvIDyJn8G14IBD/TQAhdaqQiQ8TG1YfKDFhC48bkuck+KcPBHtfjphQHFIRpS
	 bAX/VBk6FQ/og==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xPFeQ-00000008NuF-38Yh;
	Fri, 06 Nov 2026 09:50:22 +0100
Date: Fri, 6 Nov 2026 09:50:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Songwei Chai <songwei.chai@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	songchai@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
	devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
Subject: Re: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)"
 message to debug level
Message-ID: <au2UzljzfMaiL7F6@hovoldconsulting.com>
References: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

[ +CC: Saravana ]

On Fri, Nov 06, 2026 at 04:40:34PM +0800, Songwei Chai wrote:
> fw_devlink detects and relaxes dependency cycles automatically, so this
> is not an error condition requiring user action. On complex DT
> topologies (e.g. CoreSight), this message can fire for many node
> pairs and adds noise to the boot log, even though it's primarily
> useful for debugging. Switch pr_info() to pr_debug() so it stays
> available via dynamic debug when actually needed, without cluttering
> default boot logs.
> 
> For example, on sm8750 this produces 125 such lines in the boot log in
> total, 80 of which are CoreSight-related, e.g.:
> 
> [    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
> [    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
> [    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
> [    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
> [    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
> [    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000

I reported this elsewhere a while back:

	https://lore.kernel.org/all/Z6t45aOGDkotqM4Z@hovoldconsulting.com/

Are you sure it's not the coresight bindings that should be fixed?

Johan

