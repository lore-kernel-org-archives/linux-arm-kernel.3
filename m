Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9284ACFA76D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIWX+3QBlGHxsLrVfyAW5KP8uJTudDyCKQOw/ZODn0A=; b=xWgb6Z2wmXywiJSsK2DDtqZYwi
	ZZVfE/wJbSBHXXaRCcf6Gt4UrBTDa5vq85vwiGMx8nyjjBRBsyxc8+tfLxIT2+SxYrl1/m8fNzEIx
	aUv7e3SUD2gbGCilf7ciPoEHw5RegA0RVjovK/pOyje10eQZ55N5vfOGwoSfL5hYj/pIgNr0D2CiL
	EttgiXK7aLQcEsqvknn5gaBFV+VD43jzmSDEws1KwuYpe7Dlq1SLGmbwgUVfygWnBMajfJ5H5ayfY
	A9s+jqTb4TNnibt07NIg3QWHhteMr3Qy7j/3drj19oatOKCqx1swSma7iuIDHnRdkeGPy/iS6n93s
	lcBKgsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMOjo-00000008G0S-3DHf;
	Fri, 21 Nov 2025 10:51:36 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMOjm-00000008Ft2-24Zm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 10:51:36 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763722156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MIWX+3QBlGHxsLrVfyAW5KP8uJTudDyCKQOw/ZODn0A=;
	b=DjsU3gbM2PjJ7fN8F0HABnztTK4mercatwaFEi0lRCcxvjaJSLeWMRNaFa63a/0GsTsNE/
	KAWmjXLw3Xj+6tX8KIOEHR6zN/Vay/u7D8EJfSlh9cAfnWEiZsXz4ZL2soQrV8iIS6v5Do
	NXPAQ9GM186cDk03x5sArmNzMJTuHGE=
From: Fushuai Wang <fushuai.wang@linux.dev>
To: 13875017792@163.com
Cc: christophe.leroy@csgroup.eu,
	frederic@kernel.org,
	ligongwei@kylinos.cn,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	wangfushuai@baidu.com
Subject: Re: [PATCH 1/1] soc/qman: use kmalloc_array() instead of kmalloc()
Date: Fri, 21 Nov 2025 18:48:54 +0800
Message-Id: <20251121104854.75800-1-fushuai.wang@linux.dev>
In-Reply-To: <20251121061022.114609-1-13875017792@163.com>
References: <20251121061022.114609-1-13875017792@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_025134_686468_71A42F6B 
X-CRM114-Status: UNSURE (   5.48  )
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

> Replace kmalloc() with kmalloc_array() to prevent potential
> overflow, as recommended in Documentation/process/deprecated.rst.
> 
> Signed-off-by: Gongwei Li <ligongwei@kylinos.cn>

Reviewed-by: Fushuai Wang <wangfushuai@baidu.com>

---
Regards,
Wang.

