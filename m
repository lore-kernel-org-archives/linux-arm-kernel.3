Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E51C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SI9vuvCiLUNTqWd6WlsA3FjVND8EZeQ2hLnq1JM2ocY=; b=jlJXtN1nLiYBsKMpQeCBpcKxf2
	zV4Rx5pPGKdP6H47jQ1VpCCRKbmTuaWOMA2sYgSCqy6HFQuUR/WHTMuxhaQOAq83RlrpU+GLHOj1Z
	lIIKiwK0jWp7NJHyg3kzhXBXNzi4ypRAZ0rgLVEvQfU1ABLvA2oOIQwNuYozhazXxBsZyCQGeLTI+
	RW9cKkX/Z7fR9yaftlgRAQIFGm2kEc30PQ3IoAfbL1AkT+ydS4TE0MCj2bTpPAoFHQdav8cLJID65
	dA2ZEqCHaYrsJrwnjwrPt7Qa507H5k8Muz023Kqp3ypdCnu7d/xQmg8dGCDXKQTGFONaev9/a6sY1
	Zb7rRLdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJnX-0000000H55u-17g4;
	Thu, 16 Jul 2026 10:58:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJnV-0000000H549-1rvr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:58:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2794149f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1784199511; x=1784804311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SI9vuvCiLUNTqWd6WlsA3FjVND8EZeQ2hLnq1JM2ocY=;
        b=uK3+R5v9RjFyev5GBuHy/W9xqnvE3IxtEHRmJ4l+m/TjocT0VDMRHlzQYPKOdHi6vm
         n5zStidRo5JHvT7RxCRL8pn8OLj3gwdKFe0wxGeKp3nrQq4/CCDgOVSdU+WK7jriWpNW
         ief17Yv03YX5BuPnwsHxXMEwFXak+nCLmgfdn5pzjBnt7Yfqz+VKbMEH8axU9SUNyI3U
         5RMK411E0JIXTQFjIOiZmGIr0c548RYnIls/ZlgjdLcrIMJ25f7bFOVKZ/9mtuQzJMcS
         lZfV66NzRsfdGmd8QI4l4S+df4N6Fr2nH0gMA7dC7aBBC1ClxjJOfzog2b/Pbops8k+6
         zt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199511; x=1784804311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SI9vuvCiLUNTqWd6WlsA3FjVND8EZeQ2hLnq1JM2ocY=;
        b=eAzR27bKpWWVKOXr32xVmHK9uthvepiWE9seYXvimhQPbGdWAiOlgoeGjHBzYNroQK
         IR71FsgvQ2b2DTZ9F5jqVubzCt4r9ONyS9ZU8FpfidDLMVq4aFiAbBU2DxAk8/jHhoX/
         5EbvHcKFNnGNvAcGo5nRcCgyfVTwwaXIiItB1ABuTxhugOmg8w7O9Fx0Lvh6WXrSa1Iz
         v+iwGDo/d4x6XqC8fkEBGm8Zi6eHBPAm9Ic/nCNFXT7ynJJzLjdv5R6c7ogJ/+arWWIf
         atw8KBlq8yhZysc58xrSXvpSkyDy136wNtFEpxDVQN1TVyNyDoelnwrM2ZlYBGmoLSXz
         MtNA==
X-Forwarded-Encrypted: i=1; AHgh+RoR+zXKlBNUJGH3Ok93LR/ENFs6R6xSdjL8EG11i7hyzwtAETdxgUoRvmyPT9/ijQjbcy7Avdq87PT7VtHpUq7Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzpAjP0QEJBrazrFiu7lRnwO/svhl77/+0RmbmU4TKui3uxMXfd
	GbAgc+tZgaOwC2TNw6EnFzgF6BKSZ9JAT7TBBgpYUUCIGRoXePOS3pHmV2azPH8q6Ut4
X-Gm-Gg: AfdE7cmPlf7B65STW7Kj3vF0aFKseazQT5wyq57nntbkqdlc9uHng4JadraxKx+exiR
	0ePUjKlR7aJfJC5PLa2F/RB85+j8L7wdilsIT/nVKNYEPfAqylnOMAU0qXfaJYgseu7833VgHzj
	0gHZ8ZDcpUVRiFVvF1yUriOGZw57LIfs/bL4A0064cUeBGQUaZsxBLrakV8vnfCIAtqWWTCvtuB
	bQ6OtaSlx3G5DxCy+Vnzy6OuugE5zOWDD/Tuo5ZK47OrtVcJJqSnWp5gDcjONQbbqzmECXeijDN
	Xvt+kDy7g9DZPp+o63XldPoe92eIyb60BmVcmMT4FdriIO4nktYEe9huUAS4J65a12OKIYjEiWb
	fzP+BZL8a8ay+/+NFWQK90FN3IXsqZZPqM40IYzQAPtZ5nw0tFIxQdGLZ1B+EqI0hQYdKYu+qpt
	e2elySAvrkOYauwp8Nj1l/7GN6SnZ4Pep1ZHZHaXs0s1C+7yuzPPRaQD8IFLXagEoJ9WW8jbmPv
	qqaMS78gDXrUwJNsSFy/fO0
X-Received: by 2002:a5d:5f02:0:b0:47d:fc20:f6f9 with SMTP id ffacd0b85a97d-47f2dd2f413mr23607562f8f.45.1784199510924;
        Thu, 16 Jul 2026 03:58:30 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c89e5sm23653113f8f.34.2026.07.16.03.58.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 03:58:30 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: mediatek: vcodec: fix use-after-free in decoder release path
Date: Thu, 16 Jul 2026 12:58:27 +0200
Message-ID: <20260716105827.870-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d4676bc9095c2c1efcd2c0f5ff4559bac7d1e47b.camel@ndufresne.ca>
References: <d4676bc9095c2c1efcd2c0f5ff4559bac7d1e47b.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_035833_485502_83225BC4 
X-CRM114-Status: UNSURE (   6.04  )
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

Yup, just double-checked. Please drop this one, thanks.

-Doruk

