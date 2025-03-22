Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51A4C36001
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 03:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gTPWXTU4WZTCTwq9wC/iKQlj6UfK/fbRfxPhJz+SZoM=; b=iFjRIgAbBx1eraBX8SA+QwffQl
	IXMkSEv/zJCKAlXcwc4M15vEv+ujzE5PAczn+DVjXKAC/zf2phSAYBN6K/H9625qgdxd5jKolhtNn
	NpZA92YaG3WVYbZd3SVemXw7pHb3/ow5C+gX9urvrdxw6LIYWg0u4A98jOnniRo0MDxg8AFNFCTCY
	UuBom+UIMi0GWBjfZKF74l6Su0ydhI5CSnCvp10B08KwQ/8pNWpCtACBoJnWZgdmNXUF/PYKiGeHU
	hq2T/vafuf5EggMNbmgtjgeXCHjMD7+3FHDFKAYEuEQs/Y9tYGYda7RgFrXTPMjx1PiwdGiKDaw+3
	X1qk8F1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvpRS-0000000Gl1u-1y4A;
	Sat, 22 Mar 2025 03:22:34 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvpPk-0000000Gkin-3sn7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 03:20:50 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3014678689aso3817365a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 20:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742613648; x=1743218448; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gTPWXTU4WZTCTwq9wC/iKQlj6UfK/fbRfxPhJz+SZoM=;
        b=GIOeClB9L+jjHs5pHZfmRTbRT739Niav72FWAlp1HV6SwYgTWCd1T2hQhzLbjSwLSN
         fpvv4pn/S6UUPDUQc3FauoOmylWNxKwnLPVT5mGn7uMpoDUTwn7sNv6C3d8IlYXTq/lZ
         RK8T1MnOX71UBPjwA3Drop8YnTodoWWXlLaCrgkjTqDhvtBnVUJVaF0aJ4xDOsFNLZHW
         0ZZzxGHHcjw4mNQx4rSdCUOMaBq94A8QK+Ww7FSs1KxQZkcn+nx/+h5f4Ii9bm2Hp8xP
         KPjwUMEp9CXXC3WEbUXU3GSlhXOyEcYcSrMi7z0qvxf2QeCL/VjgWDyHjkX4mxJGnxGe
         iybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742613648; x=1743218448;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gTPWXTU4WZTCTwq9wC/iKQlj6UfK/fbRfxPhJz+SZoM=;
        b=JfMCfPdt5S9SBaAb2jVKNQ61CT1WsHCLl3E5+6c6iyz416z0LWMChI/1G/cKPGEUEU
         bJFnIqZl6r24daSscdpF5pfq/FW03wjG3wvJu9MgXFYkpLgegQW925ng6d8Nz2sKbBS3
         WQkeYkoKYlopSHs4Pd/ZvpXXqfIxnPgqHXseYU97z+E7RNr6/4UN8nnqHuL01ubQwih3
         yY+Hu6kcx1kjazfTxL6IW9uuMi2xE6AZikzqiIDpcUANNpel1UUotV4+g9j6eXFJCyDA
         OM68zXWY18Uhst3BiBGcYHiYYbdb2Q0F9AuoIBOlYlhDDFZy6qk8jxnvtuoLZiT0DkjL
         03FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhCHUA8x7zrEixrOv/2aShH3o3ceC0FaMJgsZkvSrAY24MMvOOUu0XLL3gLXT7Er2Yn315UOKsk2umSyDTuXb/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr/W2VLoCKWo5TR/QpuChEmWFCM0y5OJ77tkLq8KoEjY89MfUz
	Ng1vI1miIB56qJJEGei67p4G5ECl4EuBR42Mi9Mj5Qxo3NQaf4PCDC3FGm6K5YoPnKP25eSlWyp
	pWiNymMEtZCv/kdiNbmkYjJYrvQE=
X-Gm-Gg: ASbGncvEEc9JgbTEdX6O8VmiAAzMnL+hYJ8tndHRLoHtDLvZaqeiK+yozjrZNI6rjGv
	KEyp7CoUaxzwgD0KE/e1AFAydueqKDA3LvZpXrMvXrOSsyUs3F2eWg+9szPElDNTascW1cRnLSL
	3cuEYZkkJgQUzjJjq82bu8FczkzVT3
X-Google-Smtp-Source: AGHT+IFfnjtNam/LY6TFm5/GU/fwnrf5tYKht+oVi1Xq7kvfi6yfjD2djAwwYbLRPMs0E1oL9zi8WICPliINmreZ75E=
X-Received: by 2002:a17:90b:48c2:b0:2fa:15ab:4de7 with SMTP id
 98e67ed59e1d1-3030fe83954mr11239419a91.12.1742613647502; Fri, 21 Mar 2025
 20:20:47 -0700 (PDT)
MIME-Version: 1.0
From: richard clark <richard.xnu.clark@gmail.com>
Date: Sat, 22 Mar 2025 11:20:36 +0800
X-Gm-Features: AQ5f1JpL8Yar2IU1nh9obKfbQ7efjzog02pd34QJZZvlxserP8sIJW65IMDaLis
Message-ID: <CAJNi4rPaPeVWzBve6Toi8hhrxP6GROAGRug7+c3zg1crDeOt7Q@mail.gmail.com>
Subject: hrtimer precision issue/question??
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_202048_968887_DDB8E1B7 
X-CRM114-Status: UNSURE (   8.45  )
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

With diff below under the 'cyclictest -a 0 -t 1 -m -p99' trigger from
the arm64-based linux box, the interval is 1000us and the arch_timer
in the system is: arch_timer: cp15 timer(s) running at 31.25MHz
(phys).  1tick = 32ns for the arch timer, I am not sure if those
durations less than 1000us are expected?

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 11c704bfd4fb..691d1fe6e944 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -2036,14 +2036,25 @@ int nanosleep_copyout(struct restart_block
*restart, struct timespec64 *ts)
 static int __sched do_nanosleep(struct hrtimer_sleeper *t, enum
hrtimer_mode mode)
 {
        struct restart_block *restart;
+       ktime_t t0, t1;
+       int c0, c1;
+       bool hit = !strncmp(current->comm, "cyclictest", 10);

        do {
+               if (hit) {
+                       c0 = smp_processor_id();
+                       t0 = ktime_get();
+               }
                set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
                hrtimer_sleeper_start_expires(t, mode);

                if (likely(t->task))
                        schedule();
-
+               if (hit) {
+                       t1 = ktime_get();
+                       c1 = smp_processor_id();
+                       pr_info("[%2d-%2d]t0=%lld,t1=%lld,d=%lld
us\n", c0, c1, t0, t1, ktime_to_us(ktime_sub(t1, t0)));
+               }
                hrtimer_cancel(&t->timer);
                mode = HRTIMER_MODE_ABS;

Part of the real output:
[  165.555795] [ 0- 0]t0=165550399226,t1=165551394303,d=995 us
[  165.556802] [ 0- 0]t0=165551398751,t1=165552400997,d=1002 us
[  165.557797] [ 0- 0]t0=165552415141,t1=165553396106,d=980 us
[  165.558794] [ 0- 0]t0=165553402090,t1=165554394160,d=992 us
[  165.559794] [ 0- 0]t0=165554398832,t1=165555393941,d=995 us
[  165.559995] [ 6- 5]t0=165545533151,t1=165555594519,d=10061 us
[  165.560802] [ 0- 0]t0=165555398485,t1=165556400795,d=1002 us
[  165.561796] [ 0- 0]t0=165556415259,t1=165557395457,d=980 us
[  165.562794] [ 0- 0]t0=165557401601,t1=165558394086,d=992 us
[  165.563794] [ 0- 0]t0=165558398694,t1=165559393996,d=995 us
[  165.564802] [ 0- 0]t0=165559398188,t1=165560400785,d=1002 us
[  165.565796] [ 0- 0]t0=165560414673,t1=165561395671,d=980 us
[  165.566794] [ 0- 0]t0=165561402327,t1=165562394108,d=991 us
[  165.567794] [ 0- 0]t0=165562399068,t1=165563393890,d=994 us
[  165.568802] [ 0- 0]t0=165563399362,t1=165564401640,d=1002 us
[  165.569796] [ 0- 0]t0=165564413640,t1=165565395885,d=982 us
[  165.570104] [ 5- 6]t0=165555639767,t1=165565703087,d=10063 us
[  165.570795] [ 0- 0]t0=165565401421,t1=165566394739,d=993 us
[  165.571794] [ 0- 0]t0=165566400531,t1=165567393816,d=993 us
[  165.572799] [ 0- 0]t0=165567399800,t1=165568398270,d=998 us
[  165.573798] [ 0- 0]t0=165568412702,t1=165569398115,d=985 us
[  165.574794] [ 0- 0]t0=165569404451,t1=165570394249,d=989 us
[  165.575794] [ 0- 0]t0=165570399145,t1=165571393838,d=994 us
[  165.576801] [ 0- 0]t0=165571398606,t1=165572400276,d=1001 us
[  165.577796] [ 0- 0]t0=165572414260,t1=165573395417,d=981 us
[  165.578794] [ 0- 0]t0=165573401561,t1=165574394015,d=992 us
[  165.579794] [ 0- 0]t0=165574398975,t1=165575393957,d=994 us
[  165.580208] [ 6- 5]t0=165565749263,t1=165575807879,d=10058 us
[  165.580801] [ 0- 0]t0=165575398405,t1=165576399978,d=1001 us

Thanks

