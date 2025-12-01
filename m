Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17231D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 22:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ldxnw5ZGD6pkl60EQw/2//9CU6vob9bYeT2gViO5sM8=; b=yqvEMo6LSmTQ8AReKLkZ2wAo+z
	J1xLEGv5Dfrh7GvN/Jb0VvUsGDGuO49LPSHpScvUXOynHouXQq7ObqUKq4v5quQ6l52SSX63vMAXb
	BYAyRscAQIyIz9y3eqyF87AHantGCi+6ZBU9Zp+gJOHvi8NjdQsYMT26qkX5Ew2roKeiLxx2gdHpe
	dxV4lvbWAijDH5pClCtusf+CC3iYsJx5N06TYWW/WHQtPQ1AuEGl0t+Z9STUY5ckEPkx0qY1zEs43
	DOYsGsRxZ6fmdTcqPBuqzRTKVbNrC69+TKVXhW8f/5tdEtacoqVLVFlY0nPisIemjuujMeEtNMYeU
	FbVuTB0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQCEY-00000004aHr-3EYg;
	Mon, 01 Dec 2025 22:19:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQCEW-00000004aHP-3owW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 22:19:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9546A43B96;
	Mon,  1 Dec 2025 22:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCF9C4CEF1;
	Mon,  1 Dec 2025 22:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764627540;
	bh=PgXcgcE2lF6g6YJrSfSVJEMuvaWiG9HS0TNC17TC0zA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M215DCpKNJCmIezV6ltkdyFYb0o9BQz6c4JhASXZpEcI7Ck2yqRsQ4J30PbZ74FJg
	 wAOev55ptHtk7z1uJTB/AxIu68T5wogp4DALebiyeAUGxUOXY/4ugmnWOjXMvh9t+m
	 owQfAO0RtKO87c/ZRCluzgTSgqvUAHlwsdrVsottFtqZeV3kkVczX7W5IxZn2soCHT
	 DcayC0zhPJsWDAYHJis/m/sOmgI/zJLdJ63nxR0KKHhRaRjv2tgNos15z80NNIE2yd
	 WaJBU8ocVZi4/3ZT2QHc6xvjr8qy6FPqiO6IQs384eCGXNKuhB8cLKuAJ4RBfxDzre
	 zQYPJgW7Zk45A==
Date: Mon, 1 Dec 2025 14:18:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, danishanwar@ti.com, rogerq@kernel.org,
 pmohan@couthit.com, basharath@couthit.com, afd@ti.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alok.a.tiwari@oracle.com,
 horms@kernel.org, pratheesh@ti.com, j-rameshbabu@ti.com, vigneshr@ti.com,
 praneeth@ti.com, srk@ti.com, rogerq@ti.com, krishna@couthit.com,
 mohan@couthit.com
Subject: Re: [PATCH net-next v8 1/3] net: ti: icssm-prueth: Add helper
 functions to configure and maintain FDB
Message-ID: <20251201141858.399fff62@kernel.org>
In-Reply-To: <20251126163056.2697668-2-parvathi@couthit.com>
References: <20251126163056.2697668-1-parvathi@couthit.com>
	<20251126163056.2697668-2-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_141900_975591_C7DC5A2E 
X-CRM114-Status: UNSURE (   5.40  )
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

On Wed, 26 Nov 2025 21:57:12 +0530 Parvathi Pudi wrote:
> +	u8 hash_val, mac_tbl_idx;

Using narrow types is generally quite counter productive.
It can easily mask out-of-range accesses and subtle errors,
given that max is outside of the range of the u8 type:

+#define FDB_INDEX_TBL_MAX_ENTRIES     256
+#define FDB_MAC_TBL_MAX_ENTRIES       256

You should consider changing all the local variables to unsigned int.

