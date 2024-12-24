Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C5CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 12:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EUD+QP7MhaJ4SMVnh2IoAoVpTVnIg5r8oG8yAPzDEhg=; b=rxei3lwJWu1vE3kuul/fZ2TD4G
	qRHVrd1nUxrCTmI5vjZTZK7NLBIV99PLxvF7j6avp+n/4+xTwTVxA5IHWycPlBlfbo1ef3QYutZjC
	NQNDjItVHg7BgjHObZFnPpfYa7j2Lk/y8gT0fLHOAcom4p90KmtZuoahElx44EBnJ5cEK5phzTUt8
	ddXwk65E/GHsRCjbukXOHyTCVdEn6q/xUoyiWSNduwnB0An21KjDuK2hdlsSsBS9hjQW6whm+UaK+
	sGCpRPVIkQPhUdUxj+R2j0obk+yCbs7+/7HCO8fSMEtLI59sscQtR0U7F5bLxHngs14SqqeEz5jGn
	rlZgX4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4Gl-0000000Bylc-1nYX;
	Tue, 24 Dec 2024 12:44:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4FZ-0000000Byh1-27F1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 12:43:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4816FA41475;
	Tue, 24 Dec 2024 12:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09A58C4CED0;
	Tue, 24 Dec 2024 12:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735044180;
	bh=eCOLbrEQl6Q8PofZ6oAAOmyrOHt5RHJBqFDV24Mwud4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=O+ExvHZOdrFYPMSsMhUwU2SqPWvwHf8vBfEv2p0bkT3aMtPrjMDUZn1AjJ/iS2wBn
	 aEGmwKkY0h3nO2uomsaEMYWGUn2S0jt86RAPZ6r4QXrVeYsUZ61gnt13OCE0BajzDR
	 O9G1pqv9OoVLnstW+0wmpHJ5DXhT+rvfkg1xyFVui6ygVuGb57BcyUMKq2+S6v7fcU
	 PT1D3ecqKSEQ9ywSuxqvPsu3TmJRtx7Y08QtihOVh8ASBsa+RC6OJ3za9glKbEcCDo
	 uZ77B0j3zAsHUj74HhzL9v4UeHt+qmDBdry9esFMfPzDf91lFSZAoAfyxntZcTHe+2
	 Qn7tAGmZRLPGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3441E77188;
	Tue, 24 Dec 2024 12:42:59 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 24 Dec 2024 13:42:37 +0100
Subject: [PATCH] scripts/make_fit: Print DT name before libfdt errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241224-makefit-v1-1-feeccef137ee@posteo.net>
X-B4-Tracking: v=1; b=H4sIADysamcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyMT3dzE7NS0zBJdY8M0cwvLJMvUVJM0JaDqgiKgcAXYpOjY2loA/1A
 rUlkAAAA=
X-Change-ID: 20241224-makefit-31f789b9ee4f
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735044177; l=2504;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=qNYHUnAZnyBHAWNkYsjAlxvZcMVlVw3UbvcsQUL+fy8=;
 b=9cH15+82rUPew5FWYHisRJZ1579YkP0KJq670oUqZwkqMpTzQQZuQusGEXLCKZFJwse0LY8dZ
 hkbIfmJtBr/CsITqhiVUYuXQ0IpgidL4z/7RTB2Pxlpmhz0qmFvof0P
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_044301_683764_3C819EF8 
X-CRM114-Status: UNSURE (   8.82  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

This makes it easier to pinpoint where the error happened. For example:

  FIT     arch/powerpc/boot/image.fit
Error processing arch/powerpc/boot/dts/microwatt.dtb:
Traceback (most recent call last):
  File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 335, in <module>
    sys.exit(run_make_fit())
             ^^^^^^^^^^^^^^
  File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 309, in run_make_fit
    out_data, count, size = build_fit(args)
                            ^^^^^^^^^^^^^^^
  File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 286, in build_fit
    raise e
  File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 283, in build_fit
    (model, compat, files) = process_dtb(fname, args)
                             ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 231, in process_dtb
    model = fdt.getprop(0, 'model').as_str()
            ^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/libfdt.py", line 448, in getprop
    pdata = check_err_null(fdt_getprop(self._fdt, nodeoffset, prop_name),
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/libfdt.py", line 153, in check_err_null
    raise FdtException(val)
libfdt.FdtException: pylibfdt error -1: FDT_ERR_NOTFOUND

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
The example is from a different series which I will release soon, which
enables FIT on powerpc.
---
 scripts/make_fit.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 4a1bb2f55861adfce07959528e175260bc503593..1683e5ec6e6754dff3383dfec89df78b9c2fa896 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -279,7 +279,11 @@ def build_fit(args):
         if os.path.splitext(fname)[1] != '.dtb':
             continue
 
-        (model, compat, files) = process_dtb(fname, args)
+        try:
+            (model, compat, files) = process_dtb(fname, args)
+        except Exception as e:
+            sys.stderr.write(f"Error processing {fname}:\n")
+            raise e
 
         for fn in files:
             if fn not in fdts:

---
base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
change-id: 20241224-makefit-31f789b9ee4f

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



