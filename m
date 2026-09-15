Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CE1C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=05imLuzHyVIQMHKM04PeIvS2aG4jIS7ddgxD+8+o9YQ=; b=lhCC5McARbZH8lDLLiD86kbZRe
	mVhrSaor01Ml+Ao3IaAeAwp2EVoPptg0BNBLSXkiV+AkJ0dVRJbywIUgob0T5AYRR2htDluGaiqRT
	ywk1znXxCWOrb0HCtwSi5D4HMgPFEsE7cqBPE7n1iKpkIqfgADgsfu/EpbOOqSgou/frCPR+qqtjn
	YPr5BRQSINEUe9MEG/tg4UquuXfjvKdNxonAHGDtHfexfCFBi1iXM5juXTf+QFBIO2Ubd2UGdWgKZ
	Q053IGSIsNBOy9WBEVm+21ykj8g+nRglbJugYnExvwDQfGoFcyugnYgxgd4QSLQIllOFweDVlST+A
	ZZfa9xrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P48-00000005ij9-0XpV;
	Tue, 15 Sep 2026 09:03:00 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P44-00000005igz-1ozN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:02:58 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa4c24cso450946266b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462974; x=1790067774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=05imLuzHyVIQMHKM04PeIvS2aG4jIS7ddgxD+8+o9YQ=;
        b=Gk62puWvc/HqiZ2+xEaK1d4A/nBaGc1lq0K15MUr0+DvafSMRC5GSbvVnrJIwZyDNc
         rY9GmRDLAWQwPk5q7qGwTr1uyDYJbGU4O0QeeYOivssTF0qS8B5qjWyPV//tMfmef8dg
         26A255aMA8eHSREe9YotV2EJlsa6Zk9k+89ldBNCZvq/PBpers1zszs9XV0pX0Km2D9D
         IjYgZ8hYsmQrTGlVsDCUH1eo4DX+tYSkCI6QfS+QC070oQgZoRe6gVqN+tOjS2lObl+q
         ldjb+eDGapE8cPA51N8T8VEnuL16S9qBt3GU97u0mJLbkurBMqDZ6YGmLGghyPPizNyI
         MYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462974; x=1790067774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05imLuzHyVIQMHKM04PeIvS2aG4jIS7ddgxD+8+o9YQ=;
        b=vg2bfGglj5OPSJa7MB+K1z/vSLUNpFdu9Xw8f7GzcD/YVHnEf/+UeOxzqo+8OQJu7k
         i/SvJy9pab08jLGJpPUZ8MMr/y8MzKLv3S+sgcxpR+h5PISBwxGCOFIRaqK9//6ILnmG
         JRxHxUQmVRURcdX7xcVpOgy11Zn+EvlxJpjzjpf3a3CZWXZqHTfzUzhDctJZxd5s5hcW
         amdJaZ7zyccmz4xiZSNSlYIV9BMKXaIWs38awnEbFiOlko1/0+exVpBueIobBErk2qpo
         y+aWCQiig3A0yR7j56ES6v7CSCuXSCG9bWOVJbZa+NtTMpXu1h/WIbrjMWY73vvcu6VQ
         PxvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRj59IaLQgKv6gF+y6Zk1WjDoYNsLgOyFh/+v2zVe4Dmny3xYSHwZmu/Rnvh5G+zNP/XNyGBBqO/0LLy5gugkm@lists.infradead.org
X-Gm-Message-State: AFuF++lt7K0EXRK7BAEtrgHoABkMkDVNe0X4w5xiziQRHYwq1zePHnGT
	FP2T9UURh80FNvpnD+N75zZ4dgP73npfRKjcWVf+8/yZWAKVsNy1mXoG
X-Gm-Gg: AYBFou2S86AUZpxokQZ2QIquuS7jPugIAmOOmwxZ6k9wpMJ02Ppt1CX56PlD9w/N8dI
	pNNgdMMpfWPfEFC3xh7j+9Oe5gdxiCJa2jSunNHW0G3pNS4YcX1kRmIAiMpstQZEQR0NHlLuivi
	A4AO1Yn20u/z9OAUDYrsQi5nXKmVYncvvIOyKzW7z8WcPVXTWKkLtbwrNn0x2+zv8br3vZCaEBJ
	bLQy2ST2GZKuu0Dfh/UvsUuOOSpFhko7UzTqLbOwxS3GW1t0RFNDpsWGXnHK4j2F59feUSs4WHI
	LjopafO8AklV/7ws0MaJK8bMl/trxYafBsmtukgD7BgIRWrfxt0tBNlfVJRVH7CFpnFV27Mz13g
	wvI3HcgmQOOftDwvD+afzN+cpV3GxQp91XyAy+JfL++7W4byCk69jrBCW8Iok55AUeF5a0gH6q6
	nKIm0MfOZfx9IBB85bvBq1EX6aoKp8ppq06OH0Ed6xNx1HyQmUI3YU4FgUYqqbdKiyhCO2IEOu0
	azmT5PVVEdhQ6b2gxgCI+Ra1vYKt8/8NLDjxg1zV9mkebxqGEnokO3SMUxBnHmy3efBTpSXLReM
	WaZPMrTl8CL8cc3HOfSXfEGSayu1rtP6Xqkw/mGQOXfO4HC6zqRhfB78mUMfifol76k+vF1YMaI
	szEp9gVggnoVXiOP3UK+lMyN1ItyVqfufg6lHYwm08gvmZZajY7UpIppu4T21y7sXazKA0oFTsO
	Nfc+K4z0ELvSol3aNivZBWU5+SLA36aBnr/Pw0y8V5nog27egvSNN1xAmsZBWzoYkkg+roaIfId
	JvsUw8qAAs=
X-Received: by 2002:a05:6938:a084:20b0:c29:d525:72a9 with SMTP id a640c23a62f3a-c29d5259cf5mr42196166b.49.1789462973844;
        Tue, 15 Sep 2026 02:02:53 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:53 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/6] usb: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 09:02:17 +0000
Message-ID: <20260915090223.1346-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_020256_489685_1D8C7500 
X-CRM114-Status: GOOD (  10.84  )
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

Several drivers in the USB subsystem forget to call dont_use_autosuspend()
on teardown or error, causing potential resource leaks. This series adds
the missing calls.

The offending drivers were found using a semantic patch for Coccinelle
I'm working on [1].

[1] https://lore.kernel.org/all/20260915064327.1377-1-joshua.crofts1@gmail.com/

Joshua Crofts (6):
  usb: core: add missing pm_runtime_dont_use_autosuspend() call
  usb: xhci-mtk: add missing pm_runtime_dont_use_autosuspend() call
  usb: xhci: add missing pm_runtime_dont_use_autosuspend() calls
  usb: typec: ucsi: ccg: add missing pm_runtime_dont_use_autosuspend()
    call
  usb: mtu3: add missing pm_runtime_dont_use_autosuspend() calls
  usb: cdns3: add missing pm_runtime_dont_use_autosuspend() call

 drivers/usb/cdns3/cdns3-plat.c    | 1 +
 drivers/usb/core/hub.c            | 1 +
 drivers/usb/host/xhci-mtk.c       | 2 ++
 drivers/usb/host/xhci-plat.c      | 2 ++
 drivers/usb/mtu3/mtu3_plat.c      | 2 ++
 drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
 6 files changed, 9 insertions(+)

-- 
2.47.3


