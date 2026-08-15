Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B67AC5DF6A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 18:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7/QgzN5wyVgDaVsVdjpFdimGVN0rJBMi0oSVa7MqkE=; b=h2ktvbLwheIQNO4KsXA86pi8ga
	t51/09VJZSXrefQ3xEV/XuZFApEv9c1K58OlItwimogSqMXC0mwVlJx19CX1c8wVuqSlwH7meo590
	9vsiYeWkHCPTHtFX5dGu5O6XOeSmQ2Laj9elDC87UFCMbQwv+1DUSawbMPtcxWLJt/q0CwMgjpfzl
	1/a+0dGXhVX9NOmi47CxHwwQEPSH+vzHyyv6nzGYOERD7zZdIw3PCtZslFHPjhZP1Hi0tRQ1tNtnC
	D2qe4Swc0zc2EZZOtsM9FaVG1SbXFgIPWwZ/vxs6wGRxsOP5Wl5fkCeU4yOma6e9BT4NsRMUKGqwU
	pM1bHL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIsT-000000041Vu-0qLu;
	Sat, 15 Aug 2026 18:13:05 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIsR-000000041Uy-07Jj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 18:13:04 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-381b831d535so3224636a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 11:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786817582; x=1787422382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7/QgzN5wyVgDaVsVdjpFdimGVN0rJBMi0oSVa7MqkE=;
        b=UNZ7JICDie6GUiGn9geYjUA5KaR0/+aL1IoFapYCK+eK5kwtwSyXKnxHiTMeXzmQbk
         Y+OA2lnJbEPz9b0VbSs4Yuk8zmIFTA5hkbWZSoKach30n/3WOGFLUKu8COoBB2c+aNSD
         AMdzW3+bThr/gE07DAdhyY6ODweLmBZYK3Jjm7i2COuKIxQdjIFH6jin7zWiRjKFwBh4
         MFQ9voNrfqPpqKEwXRpVPBwlyoEqfDa+jIA3SY4W8rtjotgcBUA6Pt1wQEk4nwYBUuuH
         di+77Kns/MrnpMMnrdgaym24wMgiIyiXyhTZTtJGke0Uw6LeLaDN6eLwCGCXuxoAm+oe
         p8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786817582; x=1787422382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i7/QgzN5wyVgDaVsVdjpFdimGVN0rJBMi0oSVa7MqkE=;
        b=mXNEQCPw7nH9uDUTMR4OuEWgjMLegyb8LHOF9QpIl3eAXZTcIcySslE8iZIa6X5pWW
         KPozGJcHRfA63OcNOtXqxsPRdmJ0K50k04fpB0FCzg/LA3ldFO4t3kZhP5S2ELGtDBF6
         3pi3FQI1XZzW+o/94eDKJgI5AOAXqWYBBZlbGvi3Y+nlBiNY0/nynCOWJM0rpaT/0cK1
         2SgCqIBmMW+AXkPDBvWXd8MCRXbXgRX1J2W85916Z80vTdrZcz7L9t819njH+XuWKwIc
         95ZEm9p6BH7/DRULKZTRcGZIpbykCcC+2LTr26CiElaIJgdf9hc/2WS9NDPL2ou0DgIq
         jGng==
X-Forwarded-Encrypted: i=1; AHgh+RojLmk9xD1V2AobNedJSRy1XmObqDXaajyISAw+PneJq7DqMGdrF86e2ZokLJqXPvr1OTK0pdU2l5Ny3mbj/0VB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/znSMyvRSnLCjsIjx+mLXS5KrSmf/7dCAJ/V6V5Rn6iXNNagD
	KvoGBq3VHorKR8Y5PsGa+Dh7VRKBpnyRnFkm8SkGYngu65nNWBxWLJkM
X-Gm-Gg: AR+sD139nT/MS3c+SxQ3tMrwnDl1uKcph1n2udaWq0Ka8tC5ngBKNTa4Juqy4Y4ZfN/
	rcNm3A3kdYEVyJuR/uVuj1xa87kxhyJjxxUgpjmWd7MIoE0hEQn9U5PVld+Skrlkj1NI5TMDj57
	uICdskSpCBYLGcjB42ZZZ44dOCh4aVTw42w6cGXT0uhlk4SJgT0zXlsBw8JYAo9VjrWzn+02mJA
	tQjwxXE3NV3r/++cQR1L9bv7qjRbDELG4pEp4JZUKgdmE+yr040EN9J3l2/BmwNml4pnx4nzUz1
	n2dmk/6Q35ru/C0sBCu23StQxaGy25Ng2prnXxqYz4YCcnKzj/omQ5/YFxgFoLyyJeaKAx62BM4
	rFg8YHOisrWRVgoeBT72JLsykpbqIUKsAP4XNJOHvocuxmxGwMRe3ENjTIx/kJD8wb7SkAPUrCa
	jzbUZU1Gk3Q6ZkLzJa+LTHbUvyRCIi+kY1TTN2lEV9fEWWxS+LL+m5B+1CBgbBwzGKxhdLaWapx
	wXCqfJhpPEqNxyRCz6V15pQPHg=
X-Received: by 2002:a17:90b:2747:b0:38e:2f21:3bb5 with SMTP id 98e67ed59e1d1-3933baa0da9mr17205808a91.21.1786817581938;
        Sat, 15 Aug 2026 11:13:01 -0700 (PDT)
Received: from localhost.localdomain ([240a:4280:4800:6ace:25e8:2607:e94d:caaf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb7539d3sm7304254a91.15.2026.08.15.11.12.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 15 Aug 2026 11:13:01 -0700 (PDT)
From: Liu Zhenlong <dragonliu2018@gmail.com>
To: andi.shyti@kernel.org,
	chris.packham@alliedtelesis.co.nz,
	jochen@scram.de,
	maddy@linux.ibm.com,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com
Cc: mpe@ellerman.id.uk,
	npiggin@gmail.com,
	chleroy@kernel.org,
	grant.likely@secretlab.ca,
	neelegup@linux.vnet.ibm.com,
	benh@kernel.crashing.org,
	wsa@kernel.org,
	stigge@antcom.de,
	linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liu Zhenlong <dragonliu2018@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/5] i2c: cpm: fix device_node refcount leak in cpm_i2c_probe()/cpm_i2c_remove()
Date: Sun, 16 Aug 2026 02:12:01 +0800
Message-ID: <20260815181204.2321-3-dragonliu2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815181204.2321-1-dragonliu2018@gmail.com>
References: <20260815181204.2321-1-dragonliu2018@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_111303_070233_53E13EAC 
X-CRM114-Status: GOOD (  12.72  )
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

cpm_i2c_probe() calls of_node_get() to take an extra reference on the
platform device's of_node when assigning it to the adapter device, but
neither the probe error paths nor cpm_i2c_remove() drops it.

device_release() does not call of_node_put() and i2c_adapter_dev_release()
only completes a struct, so the extra reference is never released, leaking
the device_node on every probe failure and every adapter removal.

Add the matching of_node_put() to the probe error cleanup (out_free, which
covers both the cpm_i2c_setup() and i2c_add_numbered_adapter() failure
paths, neither of which runs i2c_del_adapter()) and to cpm_i2c_remove().

In cpm_i2c_remove(), i2c_del_adapter() clears adap->dev with memset() at
the end (commit bd4bc3dbded9 ("i2c: Clear i2c_adapter.dev on adapter
removal")), which zeroes adap->dev.of_node before of_node_put() runs.
Cache the pointer before calling i2c_del_adapter(), the same approach
used in i2c-mux (i2c_mux_del_adapters) and mtd (commit 56570bdad5e3
("mtd: core: Fix refcount error in del_mtd_device()")).

Compile-tested with gcc-powerpc-linux-gnu on tqm8xx defconfig; no
hardware available for runtime testing.

Fixes: 9fd049927ccb ("of/i2c: Generalize OF support")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Liu Zhenlong <dragonliu2018@gmail.com>
---
 drivers/i2c/busses/i2c-cpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 2cb6a233d313..08e33db32f14 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -671,6 +671,7 @@ static int cpm_i2c_probe(struct platform_device *ofdev)
 out_shut:
 	cpm_i2c_shutdown(cpm);
 out_free:
+	of_node_put(cpm->adap.dev.of_node);
 	kfree(cpm);
 
 	return result;
@@ -679,9 +680,11 @@ static int cpm_i2c_probe(struct platform_device *ofdev)
 static void cpm_i2c_remove(struct platform_device *ofdev)
 {
 	struct cpm_i2c *cpm = platform_get_drvdata(ofdev);
+	struct device_node *node = cpm->adap.dev.of_node;
 
 	i2c_del_adapter(&cpm->adap);
 
+	of_node_put(node);
 	cpm_i2c_shutdown(cpm);
 
 	kfree(cpm);
-- 
2.55.0


