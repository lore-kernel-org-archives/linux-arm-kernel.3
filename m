Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6913C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cT8/zmXv/UqMduSo2scBRCmGp63Q5/YeQDv4ZhdIR2c=; b=OwUs07JghxxyuDe+0ZiLR0sZo/
	IDKU3fgPKvsocwsrIvxu7DgKp0vSZSXResKeq1Tg3mzrtSs/ROyOEqIz9jugi9uKX3FceU98vhtRN
	O9i+N3Dw1VUI4LrkM1FOHJBm51aoRBGg5XmtOov03Zj5KJ+Kqvree5bTtlF+7Lakd+ZZdEovU6uQb
	ExEK/BYJoL30h1yHBC5JUnYGH5mmgPu4XJF9Y1LVAEm00Ybg2TChgrvp3nM7028rviDYl0Nq345DL
	KWftEw65ZpCc+dddr/sXMrn8iV00LL01GvvnvuJeSQ8EhOo3olPqTacB1UWKvNuu9eFXeIvI5cepg
	1H0d4DYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQ21-00000008ApG-1oHQ;
	Sun, 03 Aug 2025 04:09:09 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPrq-000000087wX-16ED
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:40 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3e3faafe30fso25237885ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193517; x=1754798317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cT8/zmXv/UqMduSo2scBRCmGp63Q5/YeQDv4ZhdIR2c=;
        b=cudl8ekhca7CSlJa6Wp74qW7mD/cemKBZNk8AeeLYML55+yPiop1VY1nJx/PZUHrv9
         SNeQ3XMaCsTewfksdE6gCWBcrJk+LYwbuWdY4cQI8dAr8a1gCHLpbvUbTRs2o1tthjt0
         DXGl1HTndObM8xWEGo+ROaOb9FwVdBFWusyAmODEPRyjSe6/chhQEE3IWsHx6dZi5Ez1
         OyITgcpOi/J1Yyo38jtBQ36VcfvpkrN05oq6ByCE5Rs6EEjPnYNriVtwkvZp1iXc1C/C
         ve/phSHm5KeA3l4cxCvOGjBjFcDMUlp/kVLUp12Oh/uEenyDnX8bXz6q8NDe7X+xI1Kh
         Jl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193517; x=1754798317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cT8/zmXv/UqMduSo2scBRCmGp63Q5/YeQDv4ZhdIR2c=;
        b=aj/rRH16VFMFzdnzT+Z/aEPWrVBRoZQd58RXxvt4n9Ov4cb3VtIiy0K/2S2SG+T+Vw
         uFpQYAWsLh8HE+fgFaQPHwStaNrPNwCxS14wQYTI8wmZyh1x75y1eHbAFM7Cd51IhoHI
         y4dklCjJRm9PwaF0WTg8ewI3WYkTrTwUiigTHYG9R1VQ1xyN5wwUPuPU1ljDmicZT/PI
         6q5EUplHqynzifmV7NGD1cTX3bW+am50d0ukZlB4/VMOzSeWBJLcfKvQCuUENknx5Edz
         5jrN9zqYsSWb14dKUusf3k8uwhG44NIRW7hLDHsS6b54VdbuBKy8xCoDGNdr5bZWsaIG
         DwSg==
X-Forwarded-Encrypted: i=1; AJvYcCWgBU7V3KQM4q473nqKuK+Q3woQNPdStqL9YT73TJMtWJzgW1GNuDoBDfNeg0wuhr1UIKY+xwitRS/+RBI+csSe@lists.infradead.org
X-Gm-Message-State: AOJu0Yyge9icVoNutQDoLhGuhTPg+5k6UReMGguIcg7/sKtPHcHw2SsR
	fSDMiZra5of0gyFYd7mtOzq99h6mhychjP4Qu06cb5zIzM4UTSQShQrs
X-Gm-Gg: ASbGnctt2C7gpEmluKAuvw1LBIpHCiEbEEr5cKFz1TqOWXIM7AuMItBDVXa7oXw5mfi
	hDd48b1ydzS5UN6p8vJf1hLbRvDXc/lOQ4gRvP1wtqWfmYZ9Gk+Qk/JH/VdJO7SKKxxk6zZoLXY
	v5fp1xRPpvVNj83bIcp5ri7vVS68TXk7BeU8+CFPkh2dGMPkNUNZzkuWuwhFYKUYc6RdSzkv9Jp
	gW1n4UIT44amElpSarEcqmiuiAjRHauHFKF8rPKFJG0afRWH3gFwdJOprSezG4Gdr6K18ydFK0s
	Nv4RRtRvDt04ywS1xShz62H0fl3NpueQotSI8XlrnD1eDZpJPdzzWsvj2SfjWPK8ZE2vryo0bkc
	+KSgvheFC0BSqzxF6A0rMkd0bAuMlofHAr8NuRIGRpLu8qq2QSvuGHjUIZu6UK1HylXnzvtT58I
	IOFg==
X-Google-Smtp-Source: AGHT+IFfI6dv+/Dwk5MRfIQvsp2r14i0lroXxft+olSfZnx9fC58ENAn+6zSkYG0IWesgfHHIjV0TA==
X-Received: by 2002:a05:6e02:17ca:b0:3e3:ccfe:d597 with SMTP id e9e14a558f8ab-3e41610a07fmr100943495ab.1.1754193517393;
        Sat, 02 Aug 2025 20:58:37 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 03/58] test-dyndbg: fixup CLASSMAP usage error
Date: Sat,  2 Aug 2025 21:57:21 -0600
Message-ID: <20250803035816.603405-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205838_304535_728D3E5D 
X-CRM114-Status: GOOD (  11.08  )
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

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6afd..396144cf351be 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.50.1


