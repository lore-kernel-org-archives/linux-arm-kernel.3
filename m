Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D6FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2gNrBnpaHs4PuvXcXL3HNFdMIVsXIYH+9x7UBV+JpM=; b=mYIwOhMuDHnmxhHpl3x0X50z76
	3Mq6NXl5oWXRk2x2vo5ddh3YvErHI9xUkE2dgm+oiURacwb2yjwh2pj/Ns7bghs1fH2EuSnkX8lmo
	UGKdhp7D4Y//aSME6s0Cnqij3W3l72+6KfgTXLloIpHp84mbECBaqYju0ayx7UNxUvxw3L3GQ+CdW
	C/9lVTTAbycdPYNvLXDvy9UW25x1ZUuFfCA6A8bavE0ZwcyaBAjKewleEYg3Y7akoGR26wHTINTSq
	HALAZ28mWoi3Pu7tA2qwZ+VHRAJUu/yBrB5wFYexOLOUxzieGq02jK7cb1/8b/D55ltNU7oViFhSU
	rbtYKVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxeL-0000000BAYA-1Nf0;
	Tue, 10 Dec 2024 10:39:29 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxcf-0000000BAGt-0ctw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:37:46 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53e3c47434eso2347262e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 02:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733827063; x=1734431863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2gNrBnpaHs4PuvXcXL3HNFdMIVsXIYH+9x7UBV+JpM=;
        b=jx6WaxZpO5x0C1iW+cONUc/shJXWLfOdEvrMK31PveQ9g5lc64wjStMuOsrt1xLAGg
         x84kXt6LvtbkaN61V9avFtFn75641pmCwJY5l9EhtX1RVNMoKYroyTH9IfWCp9GWvPQZ
         fqHFVI0UYK3iqoYvvviWrdPvVfZn8dEM71M3rQ5xLcqBJkahnzLEDz31Bj0rFqrj4ugz
         Ce+x0LF5YK/z2JnoF+H85H6xBaynvbAZMixF++SEOZj715EX8JrHxLGkrM166YLgEvde
         kkIxWWS5uAXhyeSFo7rZhqizu40L5k10VkVdqFMMMKvgux0V9jmj9yLCbNoEPD1iBBEO
         oKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827063; x=1734431863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2gNrBnpaHs4PuvXcXL3HNFdMIVsXIYH+9x7UBV+JpM=;
        b=KY3BmOlC3DtOxqIx3taBE+8toKhhwqVg4XPooUYuqN40g8vQAmIvXzxPmuuVVisIyk
         FZgm7j5szF74xDWma4VsNIO1/FitvKJYi3YQXVE68Ppee7P+EHCT/htNhdMTXlKVjIF+
         zopEET5JBxmDviYJyMrstHDFlvrkfEjaC1S0NzQNXUM3silO9ZjtOPamTjPxBawpX3sl
         ZzMxtCwukwfDR6LfFiUO+EPApAPSEvMHQdiak2ml2RhuyoqWbKe9S/dNJqBS7cG9X9ye
         VIB3LT90ZKlmRos6HvsUb3Nc+VhrarOnTiC+GoYShdd/F18tngMLFTqz6X8cUifpHbhN
         oZaA==
X-Forwarded-Encrypted: i=1; AJvYcCWE6uzlEqYPki6UB5obj/doWS18HC/O/n62QsrFmch22tgKEICBEwJ8sRICxb7PCa5gxkL5h/Oi4E3z0LlQNy6P@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpd4YwXpv2z3u/cTKue0XowDtKCRsi2ZYx7Ky5wXyVM4rK1xVE
	+1qqILX5+cl+PFMhNX6QcDw9A2CoZWj+tPI/3tvhvwhT00hCzyGxfKVznOEMBgzhMNGJ5WGHDKq
	Nhc7hHFxpl4iMMhxwLfkfQH2llCY=
X-Gm-Gg: ASbGncv2CZAfm+j26i1UxWBQ/gnLTEEtIoOhXtZhclOWnY0HAcrw27oQYtqUlbVByF1
	pn8nXN3PyfXYqlzcmTmg6D+Xm+zLDPepkKG4xx8jid/1dGlKqe+rD2exDCfJhNJLobq4=
X-Google-Smtp-Source: AGHT+IGvfRLPmahm50nu+e2exxVcMFSqXgjT/S6Twd+XgTU6pdYj8SRjRoKw86zHc3Jp+T8FWnjKa+Y2nt08isFeJl4=
X-Received: by 2002:ac2:5227:0:b0:53e:362e:ed0 with SMTP id
 2adb3069b0e04-53e362e0f1emr5392719e87.44.1733827063169; Tue, 10 Dec 2024
 02:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20241210034223.1493522-1-xiaolei.wang@windriver.com>
In-Reply-To: <20241210034223.1493522-1-xiaolei.wang@windriver.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Dec 2024 07:37:31 -0300
Message-ID: <CAOMZO5AzNVd_xut2wBBHeyccFdC+1c4p50Uhzo=+BDbV=mEP2g@mail.gmail.com>
Subject: Re: [PATCH v2] serial: imx: Use uart_port_lock_irq() instead of uart_port_lock()
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: l.stach@pengutronix.de, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	esben@geanix.com, marex@denx.de, ilpo.jarvinen@linux.intel.com, 
	linux@rasmusvillemoes.dk, stefan.eichenberger@toradex.com, 
	l.sanfilippo@kunbus.com, cniedermaier@dh-electronics.com, rickaran@axis.com, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_023745_185110_0513D22E 
X-CRM114-Status: UNSURE (   6.01  )
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

On Tue, Dec 10, 2024 at 12:43=E2=80=AFAM Xiaolei Wang
<xiaolei.wang@windriver.com> wrote:
>
> When executing 'ehco mem > /sys/power/state', the following

ehco --> echo

Reviewed-by: Fabio Estevam <festevam@gmail.com>

