Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D328CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XdYN/06x3KRPapdi984l0BW/Th8+IhDTjM+xhirl2Oc=; b=SNv8Ley0hW3cSMZgoMGuaz1ITw
	OVdiowU36v6KurahOqm55Kodfe/+62BVPij6yzqUHTGQNjcSX0It/Rma1PWMP0+lj9pXRVeZL1DcX
	dO1Ke0BD3KACN68QjA7gUM8Z0pML7npu5Yb8uzC5Vnc9l9gFrIL5gXAVPc3cSKxUVISAsbdhme8m3
	wWKgXGiNpLuLactbf8+bhhv1kWBYBDQiejlOT5QP/0cd6VXOEIpTtOriH1emK15rEqrpR9dng8Rzk
	wClOHpvG2K4qe/hfub1xJn/F/7TvvK5k5Tq9JKVleyW+8dERd5TG5gZogniitvx9mDNYcxFgCeBqO
	MtDwte+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA4n-00000002Der-117B;
	Wed, 29 Oct 2025 17:35:13 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA4k-00000002DdY-3Pn6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 17:35:11 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-378e0f355b9so650841fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761759308; x=1762364108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XdYN/06x3KRPapdi984l0BW/Th8+IhDTjM+xhirl2Oc=;
        b=kRkfzSp8b2BgdtZY7wyeMU6hbnsnCUs29O7aU+UBjEMKdnb2MQ3S5s8KQZ3eGqgDWD
         8nF5mHbPSxofk1SdHY4JD0NXEwerUlQLNqMUpHVU56aXENriNGfzT0a1Gtrt8SerDzwj
         /Ob9krIa8yDrKSxqGCkQqL4aEIkmak5JX9sz4NP7stuGZlMiCiyz+4Ycwt8FfQj/X+AI
         CRN2YlPN5MGEITJHbc4d4LdJA6VeC/B/DJbHjJGyQudIhMuHCgK5sovev4PJq4Pn8QxB
         FfMyQYyPGrk1czMdis/b49R1bbQ0fhkjtsLu/FiH/eYtqvEGxZIgpEuaLPseUx+1dSuG
         5Nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761759308; x=1762364108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdYN/06x3KRPapdi984l0BW/Th8+IhDTjM+xhirl2Oc=;
        b=iXMbJ5L7022RSdSYfRTPrj+/W4SWHz1tVVzepU627uT31Vb5eSP06A753kwaV8S+9S
         vEfH3FZse/lOwAt1896yE2CW+hB4871ZdFmqEOD8JAQZaYV8XD64T01hcdei0VmK9h6J
         t4gniYuCCzAEzjf2QSDjO0iKSk7BkJTr/nDMWDBSpuFKOlrZf0uQJCg5xZNkeBjAAov4
         ZenwzIW9lRScASWtpd+9xOz+ab47b1EhOSWjlXDs0ixRUorL1Dh4G1jxswBSt9heaI07
         ONVkcfn3oqfdb2129l3KxfhfXncpRKMOZ5XQyRgwvQ6YgM6HJhDskPemEgvdcC2YcjT6
         2pWA==
X-Forwarded-Encrypted: i=1; AJvYcCX99e5Pjg6sXhTFfRcmUjv5PQi8dGd7v4kM+UPCWe7gqAEx7qQT6JFPu5srFqDZo3QnaWmKVy3cUQ3bbRtoDjep@lists.infradead.org
X-Gm-Message-State: AOJu0YzGM4Hh9QuOEFSusCYP/fehKROWZmfBA5O30N08v2u63siimGN9
	qVi1ULtrEgt/ZjEmKXChyeM3NtDWDLCEVjl+HHPbVJfT/r39BZMuNCr6
X-Gm-Gg: ASbGncurb6W2zy4lg5rvqj5hIUbQCSblt23+vZAyqC95jwecA93WQrQNjIDHa8cqrw0
	KNP0EwJ0amfbXyNzBe2Ge80KTdsGB/UI1jbbjEfnyYhsDs1l7Uyqs2pCSzA/UI5KWhi0qYVhEg7
	51NFGLPDb19SBxbHiUpqx9ILJ2vHtp1ZKxBI0ggkGKUEsw/ua7oq1cJtJ38U2GEkIjFrLshx0G8
	rHcLLGA6+jlrIdJwQI5pG/ugdOgHi/gk1XwaEtoiprj+6n+MtYxTXK+dYXyRKIziVZZpO7/tW7e
	OPtRUV/BCeZKOw/n4bUTGjH+pcDG8Qjxlrq4K0cIMhHLCg6uby06tS9ti1A9K7kfewdHE2viA+L
	HCjz24ER6eKyz9aQCfk6GhAB2wH0y1bvRFP89OvsLURiVLV9iArrbyyRidlubfVF0Zdl46BDC2v
	ZtppSlyBT6wKtLPaUVfQ==
X-Google-Smtp-Source: AGHT+IEwDLNwLK/A2+TDrXzVle4wM4y4gZurIwihWWiE7msduXVNYsAHjJg+irNLnRcqkFgHzU7XvQ==
X-Received: by 2002:a05:651c:516:b0:36b:d9d2:734c with SMTP id 38308e7fff4ca-37a023ba9demr13208061fa.8.1761759308078;
        Wed, 29 Oct 2025 10:35:08 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee091f33sm37346051fa.3.2025.10.29.10.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 10:35:07 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scmi: reset: validate number of reset domains
Date: Wed, 29 Oct 2025 20:34:55 +0300
Message-ID: <20251029173456.1749436-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_103510_885267_41D82B43 
X-CRM114-Status: GOOD (  17.29  )
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

Add validation to reject zero reset domains during protocol initialization.
While the SCMI specification allows zero domains, the current driver
implementation cannot handle this case safely.

The fix adds an explicit check for zero domains in
scmi_reset_protocol_init(), returning -EINVAL early during protocol
initialization. This prevents the driver from proceeding with a
non-functional state and avoids potential kernel panics in functions
like scmi_reset_domain_reset() and scmi_reset_notify_supported() that
assume dom_info is always valid.

The change is minimal and safe, affecting only the error case while
preserving all existing functionality for valid configurations. The
existing -ENOMEM handling for memory allocation remains unchanged and
sufficient.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---

Dear SCMI Maintainers,

This patch addresses an issue in the SCMI reset protocol initialization
where a zero value for num_domains could lead to a non-functional state
or potential NULL pointer dereferences.

Currently, if the platform reports zero reset domains, the driver
continues initialization but creates an inconsistent state:

    ret = scmi_reset_attributes_get(ph, pinfo);
    if (ret)
        return ret;

    /* When num_domains == 0: */
    pinfo->dom_info = devm_kcalloc(ph->dev, pinfo->num_domains,  /* 0 */
          sizeof(*pinfo->dom_info), GFP_KERNEL);
    /* Returns ZERO_SIZE_PTR (not NULL) */
    
    if (!pinfo->dom_info)  /* ZERO_SIZE_PTR != NULL, condition fails */
        return -ENOMEM;

    /* Execution continues! */
    return ph->set_priv(ph, pinfo, version);  /* Returns SUCCESS (0)! */

However, subsequent reset operations crash when accessing dom_info:

    static int scmi_reset_domain_reset(const struct scmi_protocol_handle *ph,
              u32 domain_id)
    {
        struct scmi_reset_info *pi = ph->get_priv(ph);
        struct reset_dom_info *dom = pi->dom_info + domain_id;  
        /* ZERO_SIZE_PTR + domain_id = INVALID POINTER! */
        /* KERNEL PANIC on dom-> access */
    }

The protocol appears to initialize successfully but is actually non-functional
and will crash on first usage.

The patch adds validation to reject zero domains during initialization,
ensuring fail-fast behavior and preventing hidden failures. This approach
maintains system stability by catching invalid configurations early.

Testing confirmed normal operation with positive num_domains values and
proper error handling with zero domains. The change is minimal and safe,
affecting only the error case while preserving all existing functionality
for valid configurations.

This patch fixes a potential crash scenario while maintaining full
backward compatibility with properly configured systems.

Case with num_domains == 0 before the fix:
[   25.617950] SCMI Notifications RESET - drivers/firmware/arm_scmi/reset.c scmi_reset_protocol_init
				num_domains == 0
				pinfo->dom_info == 0000000000000010
[   25.623655] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
[   25.625241] Oops [#1]
[   25.625585] Modules linked in:
[   25.626343] CPU: 1 UID: 0 PID: 62 Comm: kworker/u39:0 Not tainted 6.12.0-01121-g62b3fcf44d59-dirty #1
[   25.627257] Hardware name: YMP ELCT QEMU (DT) 
[   25.628276] Workqueue: events_unbound deferred_probe_work_func
[   25.629447] epc : scmi_reset_protocol_init+0x256/0x2de
[   25.630109]  ra : scmi_reset_protocol_init+0x248/0x2de
[   25.630616] epc : ffffffff8080d618 ra : ffffffff8080d60a sp : ffffffc600263350
[   25.631232]  gp : ffffffff81a4d9d8 tp : ffffffd60e834380 t0 : 0000000000000008
[   25.631897]  t1 : ffffffffffff0000 t2 : 69746f4e20494d43 s0 : ffffffc6002633f0
[   25.632570]  s1 : 0000000000000000 a0 : 0000000000000000 a1 : 0000000000000000
[   25.633364]  a2 : ffffffd60ece0740 a3 : 0000000000000000 a4 : 0000000000000001
[   25.633950]  a5 : ffffffd60f75c640 a6 : ffffffd60e834480 a7 : 0000000000000001
[   25.634496]  s2 : ffffffd60eee3440 s3 : ffffffd60e812a30 s4 : 0000000000000010
[   25.635037]  s5 : 0000000000030000 s6 : ffffffff80000000 s7 : 0000000000000000
[   25.635581]  s8 : 0000000020000000 s9 : 0000000000000002 s10: ffffffffffffffff
[   25.636127]  s11: 0000000000000048 t3 : 00000000000000ff t4 : 0000000000000000
[   25.636660]  t5 : 0000000000000001 t6 : 0000000000000008
[   25.637071] status: 0000000200000120 badaddr: 0000000000000010 cause: 000000000000000f
[   25.637836] [<ffffffff8080d618>] scmi_reset_protocol_init+0x256/0x2de
[   25.638472] [<ffffffff80805670>] scmi_get_protocol_instance+0x186/0x44e
[   25.638984] [<ffffffff8080597c>] scmi_devres_protocol_instance_get+0x44/0x88
[   25.639501] [<ffffffff808059d2>] scmi_devm_protocol_get+0x12/0x30
[   25.639917] [<ffffffff804e3978>] scmi_reset_probe+0x3c/0xce
[   25.640278] [<ffffffff808010cc>] scmi_dev_probe+0x18/0x26
[   25.640566] [<ffffffff8058541c>] really_probe+0x8a/0x30a
[   25.640830] [<ffffffff80585700>] __driver_probe_device+0x64/0x10a
[   25.641147] [<ffffffff80585864>] driver_probe_device+0x2c/0xb2
[   25.641450] [<ffffffff8058595e>] __device_attach_driver+0x74/0xd2

If this is a working case, I will check and supplement other protocols such as
sensor and power domain.

 drivers/firmware/arm_scmi/reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
index 0aa82b96f41b..458b75fcc858 100644
--- a/drivers/firmware/arm_scmi/reset.c
+++ b/drivers/firmware/arm_scmi/reset.c
@@ -358,6 +358,9 @@ static int scmi_reset_protocol_init(const struct scmi_protocol_handle *ph)
 	if (ret)
 		return ret;
 
+	if (!pinfo->num_domains)
+		return -EINVAL;
+
 	pinfo->dom_info = devm_kcalloc(ph->dev, pinfo->num_domains,
 				       sizeof(*pinfo->dom_info), GFP_KERNEL);
 	if (!pinfo->dom_info)
-- 
2.43.0


