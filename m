Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD95CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 03:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUTtt2lgjcqJwQQf++5fPmlhKSMns4pQ4XcxLIywUOM=; b=nRxFxavSTdirPRrpZbC0AlWyfz
	Y+oxKC5/87WT6hxIFa3qkDy8Vs2/ykm0Gxn4iaTkEqC51CSD38aFecDKN7gFOpepPnjEska/3/9ZC
	TtVcuf/eBwwVYaqUzTTpU43Q6w85RPRzDjFU2hCTdVIJvS3m9TV9SqY0Cop1aUuEESNmi/hxYB31U
	fwiI+gNtQeJCoILDF1FFNE4JBhwhcLlZ9X1eCBO3IR1dl//FpqjsN4VMByyzOZGcMEPmHWhLkSzQe
	BD0VHPlg5/v2g6VCzQH0Y6h9XpsS72RUZdljadbBZRWcaOuLSSuBLxqAGUl8O3XVnvkPkWUNqsNFV
	JgtSvsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyMc0-00000006cXs-3lS9;
	Tue, 16 Sep 2025 03:44:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyMby-00000006cXQ-2W8C;
	Tue, 16 Sep 2025 03:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2730E434A6;
	Tue, 16 Sep 2025 03:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E694CC4CEF7;
	Tue, 16 Sep 2025 03:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757994250;
	bh=6C7Ju+dhzY1OJEKfUPdFBki4vKRrlbJv3fbezkMeJk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNNZItGZb1zzUcgKo8bdMydHebPYljwB/+qgD7tXublQltuS7e6zksLyIcfzDCC/V
	 vRT+DZyi6pQA/8voeBFuSq0EhjDv5g9HOkBhE9MhtWnTypGWEhqtioZQTFq+WkngqU
	 JgALwfNB2dxONDB4BTYzowwbCnZdXE8zMYWIAzITUtrDrl2MlMpH9B1w2F/neg+ghl
	 1Ri5D6s9eZst03L8ZkW5F4whXj1BFvEqwRm7Cb53ZgfjR0TfmLLbQxWx/kyFmeBfO6
	 RmhULbDroggV3OxPE9aPrS4jNQ8flNX2G3/1h6nn5tRzn7N2QJsac/iLvF57fPzjYa
	 LyG78h4prP1dg==
Date: Tue, 16 Sep 2025 03:44:05 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com, mchehab@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	hverkuil@kernel.org, jiasheng@iscas.ac.cn,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: mediatek: vcodec: Fix a reference leak in
 mtk_vcodec_fw_vpu_init()
Message-ID: <aMjdBSP1bvwvTRiO@google.com>
References: <20250915120938.177691-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915120938.177691-1-haoxiang_li2024@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_204410_658739_BF80BA0F 
X-CRM114-Status: UNSURE (   9.52  )
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

On Mon, Sep 15, 2025 at 08:09:38PM +0800, Haoxiang Li wrote:
> vpu_get_plat_device() increases the reference count of the returned
> platform device. However, when devm_kzalloc() fails, the reference
> is not released, causing a reference leak.
> 
> Fix this by calling put_device() on fw_pdev->dev before returning
> on the error path.
> 
> Fixes: e25a89f743b1 ("media: mtk-vcodec: potential dereference of null pointer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

The reference, taking via of_find_device_by_node(), needs to be dropped after
use.  mtk_vcodec_vpu_release() does but the error handling path doesn't.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

