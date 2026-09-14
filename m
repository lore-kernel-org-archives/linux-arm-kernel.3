Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D195EC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrOlDT7L1Dl8kz1yM8HMjcw+s4ZfZbKkhGl/ULkPQG8=; b=Jm1b+XUVGmnuNWesNlI5cVuvFF
	5dwd3u154+jBnTZe88V/HXFxXu1JQrFPAkNp6PZTZgCanzHd61PDRXDOMefkiFZJ8VylbxhYWvu1Y
	8c+R4amh84J0qeEm12iGuKS2RS2ieSJJQ8I/vt5pIZnVI/Ch9+sqWwirJzKcZtVPn7jWpCbbzn5dC
	bWH8WXh+Pv8L8HPnogMqQFa3eNHo4O5Qnm/Kw6dWrPWhcj/hac645RIbqIDbQvKgtGVZRhsYRgctu
	M/7J4OUvQuyGn9aajTUNl0erS6Djl7i5DQqe0ZI690ASfyZMe30RS9mnJAoPZjMAly8hAERvpGWEY
	K0mrxyQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69qq-00000004KNB-2ba3;
	Mon, 14 Sep 2026 16:48:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69qn-00000004KMX-39GP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 16:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789404492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UrOlDT7L1Dl8kz1yM8HMjcw+s4ZfZbKkhGl/ULkPQG8=;
	b=XET748iAaun8Jdg3jYEBzCaEto3MISeDaBot9uJAVX6Ai9sE0I0SCSKDEquWvQf+O7sCui
	fWor4Pgewrm+45cbxIDTMO5oY66FJiLc5cQ2rlX6i+tiK+8jZZb7mAw+l+XLvSmLK48oae
	0iYnP3leQtepmEDQhSSntla8uIXPv1s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-20QVNAcjMoy2zWENAn-t9A-1; Mon, 14 Sep 2026 12:48:09 -0400
X-MC-Unique: 20QVNAcjMoy2zWENAn-t9A-1
X-Mimecast-MFC-AGG-ID: 20QVNAcjMoy2zWENAn-t9A_1789404489
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e7de22fddso77321116d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404489; x=1790009289;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrOlDT7L1Dl8kz1yM8HMjcw+s4ZfZbKkhGl/ULkPQG8=;
        b=VlUNKuz81bGKt0S+d4bj9/pJxHdpQnqF8hzSO3O4Sd6ty8QJ0H0phBVOb979Ai1MzY
         Pq7+32IPh/6DWvaLHhgZHZstqDlNLuXm7Nfkog4mXTljtdQ+MNWM34q+czgtglomNk1B
         SrkAVSipI8Oy+Seqbb+Ydfgy6XGIKqvkHg42e9nWvczx1PQ9wT6ETtpgkppOYPjK55Er
         UAK1BcTFKE/Zocn3hyjxl3OJqAfT57pjp4FQ6EL45dV8zQSdTeIHroOTFJTpbQD8aBkW
         FJTj3HqysZ1i7IvRqWf9hEZP5OxGslYOsnb7gNLmE/jObDmq7lYdUc1BDVTJ4W4kZ9Qi
         lucQ==
X-Forwarded-Encrypted: i=1; AKwUvByulswLxc5nTlsbpZKAspR3VbAcN+qmhcqdkN4rEWy8M/ukn03JNgzGHpFCvn6ztQrzK2y5HLdv+6IC45bGMyfL@lists.infradead.org
X-Gm-Message-State: AFuF++mM9ATRDXUvgOIT8xVVJg6rlssgXRc8FNXAvuS8yNjI5jXDUzGD
	I8Tw4L1V18dKaBgAy5qlfCl59YalCbFIOCwbNNzKfE99o+gts22yHfhmJBLdYNmaMmP+PZWqQ+g
	5l8oduKIOnV8IPLfqNDvb9GMDEi2ZoH4pUOFlo1HDnlxmq8IVTYEIvwKnZUW47Ry8rVBRTx8OAZ
	RQ
X-Gm-Gg: AYBFou0WcFUJiOMrTok+I3U1zBq97Y+MDnDyxWut/b350W2XVyjfMUt1t6ArXH7rzZW
	9CwFV7BlM4BQdpRIAiE4tggLBc3uSE9ykLlr4hLU1yJK54aMBTajht533As6LEuQZERYJR07m8k
	HXq8VA5IPxH56aEIfVFeGiHkwjc07INfLDdkM6gSgRqqWm6HxL3HYD6hGznyltJNINfcGRtr+GC
	+q5jB90fQ2zDxQprwjF0XbXxByRU6AL7/Pyg0C/PgwgtfR/o87ZQmsjKCys4MZn7px/5Q9RHTfO
	rDHUQXQFiNQJPAtNnAgbaC8TYHzvcg4p/mLaHbk56yIqnNecNTi4gJRrPGbzTdXL7JDzZvd24EV
	IxTauMV4IR/vC8rtMrkhBu2ybaCFePn5I0T6bl7Mw
X-Received: by 2002:a05:622a:1195:b0:530:cf10:8a97 with SMTP id d75a77b69052e-5310d028105mr51736251cf.38.1789404488704;
        Mon, 14 Sep 2026 09:48:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1195:b0:530:cf10:8a97 with SMTP id d75a77b69052e-5310d028105mr51735621cf.38.1789404488088;
        Mon, 14 Sep 2026 09:48:08 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca460a32sm104363801cf.9.2026.09.14.09.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:48:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org, 
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260914142039.31654-1-angelogioacchino.delregno@collabora.com>
References: <20260914142039.31654-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek Clock Drivers
 submaintainer
Message-Id: <178940446474.51095.501258130718058993.b4-ty@b4>
Date: Mon, 14 Sep 2026 12:47:44 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=344; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+LRTP52U/oWNmbfVd/dRn41R6JZhfEc41nXAbJPqOy0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJWqLosfyA364GJ7ESnXd/ZO36fyFZiL+eeKfRCIcPde
 5vTPIuXHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkRTzDf8/S522nJQuW7m18
 cTj25s9nGxdedWLcpWzh2H3f8lH76zSG/9EhGXrvHDkW9/b4PzzBJx0qcPSXa/hRN+9URgNdRjd
 bbgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NNCAv2WDes4SaZjfz5h0R4yPExwIKi5DwUZPXgcADVc_1789404489
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_094813_860233_1B97BE7C 
X-CRM114-Status: UNSURE (   7.07  )
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


On Mon, 14 Sep 2026 16:20:39 +0200, AngeloGioacchino Del Regno wrote:
> MAINTAINERS: Add Angelo as MediaTek Clock Drivers submaintainer

Applied, thanks!

[1/1] MAINTAINERS: Add Angelo as MediaTek Clock Drivers submaintainer
      commit: 6b838130d2759008f8e8a80093c9eb6fcd435707

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


