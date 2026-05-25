Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29889CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6jqLwhkLz3GnNiG5F6aqvc2zAsvy9RUUFv6VMz3rWAI=; b=mlVQjAepBe3yVH
	B4SpQujANRZhmmF/5udVcLg6e9e15WwuUyoIrup6WMveDTnO3CFhMW1vPcGIWUL2T/kcddvB5/ZYp
	kCrzCNek8Cpl5Auz3W8XXYfQnaJCBa3ExGVnHJ86mx9qk7cbRn2apeTlz5DkjL7/6Foagh6mdAfQT
	+0y6pwW9ulU4JfwK1+D2MqUqveklHX1WQQjbn7O6AYMenMByv1BuvkQpmTvVtdWFYmF6w+cfNN3y0
	jIBlpPXNo+QM+5TwIkWVJ6x/TpThX2cpGI04El1QA5c6uOMKI6B+NA9JofKps6xNrkc+BCHsoqBNq
	zvx3qybkrKr8N1sz9IaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRz9-0000000GsCp-1ZJU;
	Mon, 25 May 2026 09:52:35 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRz6-0000000GsBa-2b4j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:52:34 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-367c26471f5so6046177a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702751; x=1780307551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6jqLwhkLz3GnNiG5F6aqvc2zAsvy9RUUFv6VMz3rWAI=;
        b=JICKPqQLsnmhDi9eJl4j6hVkasSWvV5iaddg/iKQSd1EuwCKnJ5RChLmTHgdbTvlDY
         GyCRWcxzKyN5fjkuJ6x1pqVgSMbsBj7ZGzyZmIfxZ97ysL51JZ2zvoh5+i0dhL9oYgrC
         CCQcBMRlSBYMWIgwRks5Xl3uWDLvwFwUwQwWPyOzR/jWzqtH/tkXsbDteqTXsc5g3VqJ
         VuvJ9C7yaUF9fj8iznDDTvCgxCztzhSGK9L2qFe9utx0lUCC7fmu9vvockHgk+4Cc+Ff
         ddLH63Cv9vvErUeLKzvAralRgVMYAJbgF69dMBQ9TwpD63TqgMNO6X92aLP3L8kuefgS
         FtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702751; x=1780307551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jqLwhkLz3GnNiG5F6aqvc2zAsvy9RUUFv6VMz3rWAI=;
        b=cTfkBoqOrJb2Dejk+ocV1gs1oItPd/jtmTa+ayRSvrN/ZW4kCC7yVBKDh25LuN+WfR
         L1SEkbdxOjG/C0IZes/OTqxIQCLXFKAe0UVkZBV0EWWrAiK7Y7fl0yWBmW6iQc68xXal
         w0L6l8INrdwy89QQNoycsuX4BQVg9HXFQTxHaI8VoZJuaflYgc0UHG4hIhP9pQ9ow2CB
         kPGFbmMNLkX69dO8XvxTRjAc4I4aZNRAfFamZJuA3150cUq0mR1EGtOVsis/yKAfggKf
         3sJTCO8ETheE7IjnTAEjh+k61Ui08L+Rt8rMUjW8EjP7dolAYLA0XdRAy+3kYHBTX0FE
         YsAw==
X-Forwarded-Encrypted: i=1; AFNElJ9jUUW83C8HTkz0YgMe4v/gWO4jzkM9GOPaLTaoeQj19BYzTxJWOM50UlQQZyM1TWIhAdRSKvD5Lrm9NE3g+Mon@lists.infradead.org
X-Gm-Message-State: AOJu0YyQH3IgZwZXTeO79G6P2s4I3OjxxERlQE9dnW7+VxQmgPk8pRKa
	sYqh/LEg7Ozy4bj7+H6G7uYO+ElnEVhEFlCUiCmnYO+MJ0euxMNh/Wf8
X-Gm-Gg: Acq92OEbgK8B6YccZfnvaVYuiI0zr1inFtUexmgG0wLFHV1583Uz8123GGYWSRpwYRe
	Ydvpl5V58jg/Qh+HGsuq+yXkv1+2XzLJ81ytXxXS1+xNOgW5+5BTx1LCL6NFJXA5xPdnBOYppYl
	L/eqiWEy8pom6Pkv2TtlYUNYHRtscg8veEvLncpHBELPICONNQ7Y+iJaUZvCE9j1U1wQxN8m+Ao
	NCKF0IM7cE082LaRIdAkdVKFSXENQzylly2oN0Q0c7YJlj/dEZy84C57zC5Gbob6xFosCYsZm/B
	40g+8rozE+O5AVS2/75Zs09klTCUEcGT60dUD88s+mwlgG1b77PG4AITep7KV6b0bTSIsl15OqG
	ffq7SwUXafmG6EI7raW5fo3orzT2esZmN8wib8fbyeaGVAHIWpkWpMYuklDf0HHabVTZsKkultM
	hgbnbcYRvVmahXeJKiHLvA
X-Received: by 2002:a17:902:ffcf:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2beb0385f3amr153090915ad.13.1779702751312;
        Mon, 25 May 2026 02:52:31 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:30 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 0/6] media: meson: Fix memory leak in error path in vdec
Date: Mon, 25 May 2026 15:21:48 +0530
Message-ID: <20260525095216.12078-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_025232_662431_5DD1FA9D 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: Sashiko <sashiko-bot@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

V5: Changes 
Following chamges try to fix the memory leak reported by Sashiko

New issues:
- [High] The newly added error path in `vdec_start_streaming()` leaks 
  `sess->priv` when `kthread_run()` fails.

Pre-existing issues:
- [Critical] Race condition between hardware power-on and `core->cur_sess`
   initialization leads to a NULL pointer dereference in the IRQ handler.
- [High] Returning buffers for both source and destination queues upon
    single-queue failure orphans active queue buffers.
- [High] Concurrent sessions can bypass the hardware exclusivity check, 
  leading to simultaneous hardware programming.
--

Reported-by: Sashiko <sashiko-bot@kernel.org>
https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/

V4: Changes:

Following chamges try to fix the memory leak reported by Sashiko

Pre-existing issues:
- [Critical] The `sess->esparser_queue_work` work item is not canceled
   before freeing the session context, leading to a potential Use-After-Free
   vulnerability.
- [High] The patch attempts to fix a memory leak reported by kmemleak,
    but misdiagnoses the root cause and leaves the primary memory leak
    (the V4L2 control handler) unresolved.
- [High] The driver does not verify if `kthread_run()` returns an `ERR_PTR`,
     leading to a kernel panic when `kthread_stop()` is called.

Reported-by: Sashiko <sashiko-bot@kernel.org>
https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t

Thanks
-Anand

Anand Moon (6):
  media: meson: vdec: Fix memory leak in error path of vdec_open
  media: meson: vdec: Protect session exclusivity check with lock
  media: meson: vdec: Set cur_sess before hardware vdec_poweron()
  media: meson: vdec: Handle kthread error and free codec private data
  media: meson: vdec: Isolate error path buffer flush to the active
    queue
  media: meson: vdec: Cancel esparser work in error and stop paths

 drivers/staging/media/meson/vdec/vdec.c | 54 ++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 10 deletions(-)


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.50.1


