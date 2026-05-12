Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B32FCD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uk4IPCSr11MF3+VFMuCwNzG9pONr1nQHBxTTfK2HGrw=; b=n4RS8sKcgLTH2s8DXr0WGgClwc
	FpZRXf92L2MZ36VyoDkZnhYb2mg9eFDmwEFcLmPqKqbPQMM7RAsE0kvFIBpKo08VZ3QtfRJgxajMR
	luWohArIdXQ8QJVtwDhQAESLqM8l9vKpfyRZVXyRH5EOsuPa6bql78mTb17m0FodENgqBMOCejqu3
	ggstdxsomO4bHldfA+yNE8FBW2UUZmuApA7GCzbCas0+LQjh9yX/hslaj2IC89Gj9DXxu2iAZEaTB
	r1cY3PYPQ9I8qS9VCibYm6rx6ziMzPgPXcvjuLlkcZw64B41Dnv9K1TVevTn8CSUdVuqpUH/yf54x
	9ysA8jyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpxF-0000000HMG4-3OYL;
	Tue, 12 May 2026 16:27:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpxD-0000000HMFK-2BqR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 16:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Uk4IPCSr11MF3+VFMuCwNzG9pONr1nQHBxTTfK2HGrw=; b=D9owpif/1VRBfgKjSMtxr7Jyb3
	JPAQ74bWU8hGYr74spo/EWjQVw0/u8WA50WCnWOY/+D4cMFkiIaJZQBCavGBS8cZ/rnzYKidEXlhX
	Jb1x5Qib9C/N7EBg63jT6FYouZmJ6Zi8LBoUwTu7g3cA59MDNkJdbAFHrqDj6cxUbJ96cZgXcrdFF
	p7XOXFqESGhWk4+8H1W9JdfyhOg2NktWf0fZ9vMr7IaTvkU0icLn2uvA7AMbMBkKrO8XV+S/8aTaF
	C2GK7O7syZZYjMDxZ1bBoEE6UCIzLTja1HZzE7jnWH5ZKRE29+J2uVR8qFceuiEtbSBNtuIKbX1O0
	Kmtc5PnA==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpx9-0000000FKGe-2CAc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 16:27:29 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4gFMRv0zLyzHnGkT;
	Wed, 13 May 2026 00:26:51 +0800 (CST)
Received: from mscpeml500003.china.huawei.com (unknown [7.188.49.51])
	by mail.maildlp.com (Postfix) with ESMTPS id 3345E4058E;
	Wed, 13 May 2026 00:26:59 +0800 (CST)
Received: from localhost.localdomain (10.123.66.205) by
 mscpeml500003.china.huawei.com (7.188.49.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 12 May 2026 19:26:58 +0300
From: Fedorov Nikita <fedorov.nikita@h-partners.com>
To: <1234567weewee457@gmail.com>
CC: <fedorov.nikita@h-partners.com>, <stepanov.anatoly@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
	<virtualization@lists.linux.dev>
Subject: Re: [RFC PATCH v3 3/7] hq-spinlock: add contention detection 
Date: Wed, 13 May 2026 00:25:02 +0800
Message-ID: <20260512162503.1843025-1-fedorov.nikita@h-partners.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512144908.610907-1-1234567weewee457@gmail.com>
References: <20260512144908.610907-1-1234567weewee457@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.205]
X-ClientProxiedBy: mscpeml500003.china.huawei.com (7.188.49.51) To
 mscpeml500003.china.huawei.com (7.188.49.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_172727_905240_55C4E726 
X-CRM114-Status: UNSURE (   5.05  )
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

Hi!
You are right - a call was accidentally dropped while I was splitting the series.
Sorry about that. I rechecked the whole patch after fixing it.

This is a small fix.

Thanks,
Nikita



