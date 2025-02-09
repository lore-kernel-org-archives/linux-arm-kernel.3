Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3862C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 16:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EUD+QP7MhaJ4SMVnh2IoAoVpTVnIg5r8oG8yAPzDEhg=; b=KFjZA3H5nPotKNA3zv8WKpRT6C
	8QdYERIeP8tiQAUMFUBwViNymXYVYXKmTfyVm23ZXxiENjGDG9yv4d8FRloGQtP3TK3LzJores/RT
	tCYDrJVaFsVOKCgztL7JE75QKP3CXpMxsXLLN4r2Ow3ByhAEigMEt4FoGtaRShog6XYQ9ezyScM8a
	G+JwQ2EC2Ttzlg97hFzrWgLcSIimrS5WV087gRfAfadoXJvfXsUuMZR3WdkEedAvrjSexMST3btFo
	0CE2zu9eFilSgbZur0WXEE6+66N8+VQzpX0l3pVi45pEMykP2CJ2Kqtfs1gvc5JEzMNqvce0BdVt2
	xdxhlFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thAcB-0000000FD7X-1sH2;
	Sun, 09 Feb 2025 16:57:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thAam-0000000FCzx-0UcO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 16:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5493C5C4C05;
	Sun,  9 Feb 2025 16:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4BDEC4CEDD;
	Sun,  9 Feb 2025 16:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739120134;
	bh=eCOLbrEQl6Q8PofZ6oAAOmyrOHt5RHJBqFDV24Mwud4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XlhaW5VF2PwlDSvZJ6i+sR2DyJNLUZmqnuRy+1uj+6ySalY7gy7Oh8fLXv4n6Fhe/
	 MNrQwkhRpgHN1Zq1py9SCtr84RTKIHr1J0orNQGwSmEODWY32kRWq5L/EBQ2A3uq1V
	 0pVo9DgyBCoEIV4rSfTGkVlpk2CiGJG1zfI6Md/kur4OZBNQTjq9AxwT+hL/oBD+cM
	 MpQ7Xtsk9yUzmKp5OYGrt1TIiOdnyg0HMJQGrwxf4NKIjSFbGmZGwL8TFV5PXo78ot
	 FGmbF9QvGoO/ErNMdgLeO+7FKZssWhNb8BSo7fd8Xhj7m442mVaVc24Q3p3VAiYgk6
	 Ys2SYIxhFRzgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D86C0219B;
	Sun,  9 Feb 2025 16:55:34 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 09 Feb 2025 17:55:28 +0100
Subject: [PATCH RESEND] scripts/make_fit: Print DT name before libfdt
 errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250209-makefit-v1-1-bfe6151e8f0a@posteo.net>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739120133; l=2504;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=qNYHUnAZnyBHAWNkYsjAlxvZcMVlVw3UbvcsQUL+fy8=;
 b=wes9wYfXwUGeWcaAUCu5kNs9CIRC4rXfWm7xTK2sserLOYrdIsz035w6eRJCAu9HPXjuGFcPu
 XXRyQ0UxUh3B2Gh1qwiZRLDA2mTnDEc830lGFG9jdndtFQphIiX7FgJ
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_085536_246364_D8E4FCCD 
X-CRM114-Status: UNSURE (   9.21  )
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



