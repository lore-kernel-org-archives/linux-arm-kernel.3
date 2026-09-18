Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041EFC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4B71N2IefxaDBJC5J7wDGnpZnwTMUCJ+YZq+Dx6EkG0=; b=vEhfWOu2Rki1PYlt9glbShrDwA
	yZRWCfRRJir1EpnrIuPlv7MSPAZlHvhsaRw+vky7WNjmgxCC57O29ahhP1Rc3pL6Eu7bv8an5i8ea
	VHl/ssrgmu9ItZqaDtN88JIlAoe3Kh3MHG+3rf55FGnPEqIPF8e0+zy9+sJColdXXNz4UdctRsxoA
	hTcFtebK6RITvErvgBx7fe/sLaIvyYZRxpAP2CuO4AupHCbX7bSsthjC5qMhPa3lOPAw/BtJNDRSd
	+T8mCiXfNtAZ9qwzztXpPFHyelxfI8QF4sg2tLnVbikUt3bUTbEGxrntMAmWytxbIjYtIuW2m98Xh
	7msw7SMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gov-0000000FcQs-1vZx;
	Fri, 18 Sep 2026 22:12:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7got-0000000FcQO-037W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789769554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4B71N2IefxaDBJC5J7wDGnpZnwTMUCJ+YZq+Dx6EkG0=;
	b=cF4QbZ5pFsA0Y/dcWPC/YWu7G7H5yej6FkE72QQuLDNebQ2vwa4JfedDGLAIibt/12Z5m9
	USZDcYRRG9I+Yupl51GRLMpPzZmXTliddA7txp2dNI0+QEhnBsVH3YDE3Vn9oOKbMz5JGC
	n3ysk4uIrGQYo3M8zgU5YbW4jlIHuOc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-ENGPhYPkMLWXOBG3JsTyUg-1; Fri, 18 Sep 2026 18:12:32 -0400
X-MC-Unique: ENGPhYPkMLWXOBG3JsTyUg-1
X-Mimecast-MFC-AGG-ID: ENGPhYPkMLWXOBG3JsTyUg_1789769552
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90ce8ad8002so25436806d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769552; x=1790374352;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4B71N2IefxaDBJC5J7wDGnpZnwTMUCJ+YZq+Dx6EkG0=;
        b=kyaEfaZDCbSUd6827FlNhf7svZzYCpifjsfYDW4Tfo8cFyOzb+oGnyfKDqCMu5sN+S
         J6sAKBwxSyfHCpJWpfLH5Qggk3nM42srAZVbni7mubhPzQjCf+eQ5DUMCz5NVWbqbmAN
         88Jcg7eoEVaQ7RxNeu2KAvTYHQs7kz/7N3Ymde5XFyi9Gy/wJ7XBzIl8nWt8yWJk3zev
         Negx1MdNNNe1ajw0AD5VO6yGmufRhIr/pqUESqmMdMqZXdRpo+bTRSkzdE38HDEIPWdG
         I3uchSZD9eOZ0ADcnV2/W5DMdoI6WmCxu1IyUezMBZkMmH0qgOx07z+j2iQRM3PC+Kya
         ifxA==
X-Forwarded-Encrypted: i=1; AKwUvBwTWq2Jtr+VgBnW+wdy+i6eJar0RA4su8QShRf/AimvM0a4y3X4FHUnyogfh266g0F/D/5OgdPF7kZb/VOgl1Cl@lists.infradead.org
X-Gm-Message-State: AFuF++kMktNcuvOAqJWPnNdAM3YoFOek24dYobpXGJmXqT8kmFfigObx
	Z6sbsWMWwpOJejsA2Yuy7RSA8XvfIV77mM2tJy2jc23gnbVVkRxL4vMSgfrDAGAKIGB/+sp3VEM
	46Eif8vVlrV3IvOiN1FPu6V8GD7X3OwUvkaYOpdU0w36EldegvAXu+o6hGpORAXaKjglAoSsBGQ
	C8
X-Gm-Gg: AYBFou1dWFW4+OQMySVrpOtFCZ0gz9qgUqNB3aWMjwUOyzOLMpMbpygeSuYZj7CklYD
	ZYvy9nIsspw2i12ZP3jRzcQe2XY3jwEAwYDZnEx9WlIc5kFqtUCd1/jwXXJYbL2TaAC98HD/0c3
	shuTvHNRyzyVVNyV3zyyxxfiBoaNH5eSf5a9JAwmGjn+CT7h85jMy7DiaX/kXwMgD1E2K9vyvue
	GGeJuhOyufbCKM/7cTXHpAYuLWP423pTqx9LhfM9bg9TT+E+1nTeSdEmDO4kJlgkSW4Q4+mRBNc
	+aDFtzifiewqQDrS8rZX5CutVtIpAtniEDLH5JjDA0MRVSUQl7efaeyFGnBX2tFSaMgyXdI+F3f
	7BQ==
X-Received: by 2002:a05:6214:842:b0:912:517b:40e5 with SMTP id 6a1803df08f44-91254c23ebdmr50097046d6.44.1789769552174;
        Fri, 18 Sep 2026 15:12:32 -0700 (PDT)
X-Received: by 2002:a05:6214:842:b0:912:517b:40e5 with SMTP id 6a1803df08f44-91254c23ebdmr50096696d6.44.1789769551717;
        Fri, 18 Sep 2026 15:12:31 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a85d40sm5857696d6.34.2026.09.18.15.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:12:30 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org, Triet Hoang <triet.hoang.dev@gmail.com>
Cc: bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 mcanal@igalia.com, wahrenst@gmx.net, linux-clk@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
References: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
Subject: Re: [PATCH] clk: raspberrypi: Handle cpufreq device registration
 failure
Message-Id: <178976953851.517928.608099813056802263.b4-ty@b4>
Date: Fri, 18 Sep 2026 18:12:18 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=323; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=SBf0+CgjodmBLbd7LoXpbgatcqyYs36TBu2fL/e41M8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLWbvfobjxq3Mc0R+7p7/Mq1YZ7f4S9W/2p+ZCYg4y8B
 7fukRPuHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkdBojw+xrVQrlS+/Velhs
 SRH6cWphhfHU4sNaGjGhi47HGTque8LI8GZuyo6FT59o6rm2pRv7yaySXjaz+NKe1I2ie+KNUj9
 O5AMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c5nWhO-2TGpCK6fCtzfj_J-auo1NEVTzyr-8mrNERE8_1789769552
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_151235_123077_4718F98C 
X-CRM114-Status: UNSURE (   5.89  )
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


On Fri, 18 Sep 2026 11:41:30 +0700, Triet Hoang wrote:
> clk: raspberrypi: Handle cpufreq device registration failure

Applied, thanks!

[1/1] clk: raspberrypi: Handle cpufreq device registration failure
      commit: e98e3d712023859af7cd78bb7fdb87ea3a9ffb83

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


