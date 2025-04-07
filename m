Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE590C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNL+NAWFI0GxoBJ167yJeoBFSWA7FvYgScloIAzLUeo=; b=jS93b3Xbnszsa12mIOIav0T5nC
	/xi1Y+CM/LlNNjxc6nYgc0Cx4DYPQVPPb4sXrSpdv/EnhiHbYt4MSmkjYf9vCYK7ZXkyQpGwONfIV
	uIjDleQGHA6KxNyR9Ifc8Xj2INsattfeNA+/jEZWUd7DJLiBx3uWgxMK4ufTU4ihY4BKRTPYctS7u
	LgXdYJiM8rf9J7NqenvDsoSbITS+z3C2duTw9hcd8FvI8zoPTh7ZcTYJuJSaj96vfpwnUU6TV6K8I
	6uzQqb+fNXOE7PD0B1hcRpK7C8XQWSAk/3JTT0bHNdbjT3+deuWIsAn9l2mbeMXwrkae9b2qLBFTa
	dA7WfnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1noa-00000000oT2-0hWv;
	Mon, 07 Apr 2025 14:51:08 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nP3-00000000iIo-2PTL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 14:24:46 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-47663aeff1bso39611391cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1744035884; x=1744640684; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FNL+NAWFI0GxoBJ167yJeoBFSWA7FvYgScloIAzLUeo=;
        b=Vr6bvQB1sSWh2KRAsMWfws/QK1RtXVDFRkD/FfbghQvVBBzlJbktBvTtbhkW9ivRvZ
         ScOOYqb2m0JkLJ2ne987qctqQxCntroJbesKEB0tntYf9XhlnHHtgMdOUBpcUffnrPyC
         Efh2Bqwla88sjpNLARN0Hz4PjyECJQ71VJkXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035884; x=1744640684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNL+NAWFI0GxoBJ167yJeoBFSWA7FvYgScloIAzLUeo=;
        b=qB1vlYpCSCN1y6TYIXXtuq9Ui0v1aHa2ApDiEo91wnN7jhftcFchtOKDVoDCK/Egzp
         510Nc8B5+SFn1AsyM91mz07o9zpWrrxZJtQ/kNtvDBAU+mGNFwuTuizakr6UlgRRSfaG
         dA/XbC3LFO1ZTNMGvaWuD8BIjaR4yEHhooRaEqPRgBxJlMkiORRIZwLtA2dK6wGvFXlI
         WF4fCozXAN+4hFplw3cGJRiAozxwf5q6Ib3hvNKkP6Z2BgJYMkH9U3vWyTxe//kqXha0
         HLV0WsN6STeH3iZ7uC8fZUHfrU0JwnNYGt9mspZgD9qI5v81maV9tznj+krkuiLxjUTD
         J36Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcXTw6yqrXVw37TkT/vGNlr+V0Wqk3UHUgBMB59r6dJd6PWAZHWQxfaJzkIaH4DDgDR0bj1t8dzroNCUSsH6cB@lists.infradead.org
X-Gm-Message-State: AOJu0YyTcjH1AoD5tyKFov7W825B/y06/RiuD3/Nv3bm3geHJmpu20Lt
	Aeuhu49wSGJYpvopQ+pTvRqr8v6dOqRAW1s0CXV2l9mvgzv5zUM4vkP9B0joK/j0cH1fO5AvdQo
	lncXC1V8W7h0nEiv8TQMJ3Iejxvb/RGVVH9ZJhQ==
X-Gm-Gg: ASbGncvhlc/AWwR/1zZI33mGvQWNCv543lYUgviJ8ldbrmyJ7xGyuHihwnAPmQLEK5T
	V6ASusnK93olmovrl8RV5rT66NwPXes4mR1/1MhOQ5+iT7TNtEM5EkciOTpc9O0k5pAj1skWqKb
	Lej7Cu/j8/6+qB1iVeV44XlKZswV8=
X-Google-Smtp-Source: AGHT+IFQd4jHNyMbSuzJ059jvOO/iExVzCO/KphR667EKFZiLjHNp+k+91snAGwPCrKp9DxvzNZfuI0F/c1qQXQ410A=
X-Received: by 2002:a05:622a:199f:b0:472:bbb:1bab with SMTP id
 d75a77b69052e-47930fe7403mr104524641cf.24.1744035883851; Mon, 07 Apr 2025
 07:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250407115111.25535-1-xiangsheng.hou@mediatek.com>
In-Reply-To: <20250407115111.25535-1-xiangsheng.hou@mediatek.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 7 Apr 2025 16:24:32 +0200
X-Gm-Features: ATxdqUEaLGT2M3QdvlukIOwAEuscXulm8_kXjOV6iVYrWf5p1vewCG0W1HdKGiE
Message-ID: <CAJfpegsN47xDbVFsu=-TLW+A2=-33fNY83zt5bhebFqH67LAVA@mail.gmail.com>
Subject: Re: [RESEND] virtiofs: add filesystem context source name check
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, eperezma@redhat.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	benliang.zhao@mediatek.com, bin.zhang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_072445_614110_6F81AB47 
X-CRM114-Status: UNSURE (   9.28  )
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

On Mon, 7 Apr 2025 at 13:51, Xiangsheng Hou <xiangsheng.hou@mediatek.com> wrote:
>
> In certain scenarios, for example, during fuzz testing, the source
> name may be NULL, which could lead to a kernel panic. Therefore, an
> extra check for the source name should be added.
>
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>

Thanks,
Miklos

