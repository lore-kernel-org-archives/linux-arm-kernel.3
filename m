Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE818D7831C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyryQPDkgnSwDrJqaTMsZ0c4G7WbCQxXZVk/3mnOxLg=; b=VmwWy9bZv709j4KviKyhcPA3J1
	nTFWVA4R9CR5XzxwfCzY8lNT/8fpHip7Uz0VG7kcNP2WHTTmGXgdkpu5fZugc2+8HkVU4MM+RlNlD
	aWeJ+Pxlvq3I4tQBbY31nYi/uEpi5Pledw8Vfv3ZOfos7IO/RPg7/zc0DpgFAcIoQTQCc78MbXw0b
	nE8Fsq5wqr2lK5jKidxzhmYY8qHEPNsw1LRHFCCpS7Zw23ZTncm8uWwWlPwFfRdMdMXePrr3Q/l/+
	XW/039zl8Dc23pwctgNlnLokh7AEvHcHlNypjPgtIo6EKucXcO2UFlfgKdnek4gYHHZ6wH28aCLco
	V58z0o3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAZm-000000074yP-1ffT;
	Mon, 02 Dec 2024 17:51:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAKH-0000000724G-1AL9
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=lyryQPDkgnSwDrJqaTMsZ0c4G7WbCQxXZVk/3mnOxLg=; b=IBNu3NqKLIHlDh2i8Xvf4EJblr
	O00E0bZIi3+f1WzxhDSD4zoQ4oQthXLlZCVSH1RXC8S6yHjsZpjaoGzdTGlnC9jl7SSi1h+pWDoO1
	bztjWuIZeGsh7jlPeBg9k8c9bZrw1kC79oMp9t1I3+++/herG2NzQ+8O5h77y9IwxKLtW3HvZmy1i
	iK/1cU9Ce7uUaF8eZiyf6ItmpJeJnw/DWNYPD+F9M51qr+7LOdIdSdFsPav59SgmcO3Jjy25CSUHx
	AMT73+UHbayXbG398ocvt91MMrgmTnO34zZYwSkVdosi2nIxO3FCz0oUIMNu0T58FHTSklDlbK8nR
	mLeyDOvQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAKD-00000002Dij-1MAk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:35:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0EBD3A410DD;
	Mon,  2 Dec 2024 17:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6DCAC4CEE1;
	Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160904;
	bh=yr8nPgorqsKZslW18S7DrfbJzdSBjOy5Dm3FgmZaCBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FXO4sW7K+gc2vwM1se4GLS2jISLC4Hv85218fTBlxgqHaepVn0KVqtw5xphianfNI
	 h+wVBnQYK0tMREorbt8f9+hmHMOkOSVx+q+E2s5zbRrnGuoCllEFGiWbUwo6Fjllmy
	 fCUyb8OgeS7twO7222857W4QWof1k1Sa8HgeTQwrLcD1Ei793+c8JCrdZ5RXLygiws
	 ZTk+5w6Tx5013RuYIOLIHRFEV6bNFL/FTUUdlecC4pe15aPkt4CYE2ksT3Nnc0r5qj
	 N5aHHomI55Mhxi7/41e44zKJc3dncVCnCU4vbjgHyJ8SVCvF77uaHJSsGp7/RVdgkQ
	 d6o3sa2MQfa2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BE6D7833C;
	Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Tue, 03 Dec 2024 02:33:31 +0900
Subject: [PATCH 09/10] coresight: etm4x: replace __is_const_expr() by
 is_const()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-is_constexpr-refactor-v1-9-4e4cbaecc216@wanadoo.fr>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
In-Reply-To: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 David Laight <David.Laight@aculab.com>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
Cc: linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=2a9e0Sg1+HnRtDgEsb84OXVQoFxUHpuXTO0qI7avR5g=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOm+749O6FPas2ybatTeWc7prF16x3VX6XbM9TgktOrU7
 v8zpTx3dZSyMIhxMciKKbIsK+fkVugo9A479NcSZg4rE8gQBi5OAZjIEUmGf4rH5jmVbpEP/Ddj
 A+/Sm/sTG/nmCVoanpxpWRL3vYGNfyIjQ/eqI0k+TNe37ZmStZpB6ZREi/BkBbfsadXL0zZxGHr
 +5wYA
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_173509_910036_A8807AB4 
X-CRM114-Status: GOOD (  11.51  )
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
Reply-To: mailhol.vincent@wanadoo.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

is_const() is a one to one replacement of __is_constexpr(). Do the
replacement so that __is_constexpr() can be removed.

Refer to [1] for an explaination of why __builtin_constant_p() can not
be used as a replacement here.

[1] commit 4d45bc82df66 ("coresight: etm4x: avoid build failure with unrolled loops")
Link: https://git.kernel.org/torvalds/c/4d45bc82df66

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 9e9165f62e81fe5a87d35b4e30bc23f93cb211ec..91cf81ac46f44418f76783c102477d08f9abc70f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -492,7 +492,7 @@
 	({									\
 		u64 __val;							\
 										\
-		if (__is_constexpr((offset)))					\
+		if (is_const(offset))						\
 			__val = read_etm4x_sysreg_const_offset((offset));	\
 		else								\
 			__val = etm4x_sysreg_read((offset), true, (_64bit));	\

-- 
2.45.2



