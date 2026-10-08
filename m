Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A39FCA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gKBBoh6HIExyZfgEBELC4DDNErGf2q0ik6xe/8PDlI=; b=T2oRTFB5nSUoD2R3PogcwOYeqh
	9Kv7WCjL0hXNvkWedTHl8LkiydX3vfl4qz+gkM5B8Dase1Xzj4YurbSveUQvSLHoD+CZ402SYdINN
	4EEflDACVzuwEZGlry3379LplP+AauQDo0e+eOKOzRVcfx4YjOswG1xE79sMQFjOijUt4CdUSYrGb
	vM+M8fwq2OQf4ZBYq3ZxzDeJDXkOIA2AVt2rvnhSFnXHpN0Lwv7YVxWU4nA7J+3m3TFLyHZl1qAba
	fTW7obLPCLDN42QIzFqIxfzovIWUxiYty0fQXDSZ5KAJiMOi5EUjxaAlg816q7WjM/4MOWfMOEtM0
	t4R7HFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtbb-00000004uXE-2Elm;
	Thu, 08 Oct 2026 19:16:39 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtbY-00000004uW3-2Gkr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:16:37 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-3535a54bed9so733735eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486996; x=1792091796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gKBBoh6HIExyZfgEBELC4DDNErGf2q0ik6xe/8PDlI=;
        b=ZtqLy4N0uTYrL+paJwqKRMDmYm6C+UIu/5m21498Kv5kkk4blvlg9El6UI6QC9fVP9
         nk6Uamp27YYFkJKNEjcWFEvXSaMjaKp3AO8sRXbWGKX7NRK3ZWSBBNxZYkMjw7HLBuKu
         Rfxe0uuZFcRWn6Lf5CGs0n3AargKxq28dbvRUfOTjcarVT6T2jJQlBlLGI4Wyr51vXtH
         gvufrOWZ1/w6GNIjHE4qVZ8at301pw6jkjWvzlEzwWD1G9cbTBmmxZJbGthd7phiyZjT
         b7naRTmGe/A9eoSRyvxgojK4fOfP+rgnK4mPrKPmGp83Q8Qh7l8sX92DGRum3iXdXVCR
         7oIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486996; x=1792091796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/gKBBoh6HIExyZfgEBELC4DDNErGf2q0ik6xe/8PDlI=;
        b=XGQX0wCk1eLkYCKn2ygpYpS0aMf7M7mQMHDHikvlwD39iK18h35sywmp0pMdOxDM3q
         W5ZzxeF/kqydAA6lsN/D6HH2+v0yxCuLaC1wMCLkQibDPevNZtekINNLfknLb0VuW2wn
         FpEV5f2aJW6KZvh0Dqo4wQFj0EirCoQCUb7ryQMgcse35iLKHm2HYxm12JbW+1ko3ij2
         h8gh8mSfdJw5JlbmhvmjhQPhWCpsa9sUBIUUGHGX01Mk893DNgutmUQjYFlnX2ZjYXAY
         kETEOPeCG98+CNNmYTMvznYt2raTruYPCyFxi2SCcq1fDAYP6OKj2L1iAFVqXe2J2nmn
         E3pg==
X-Forwarded-Encrypted: i=1; AKwUvBwQNdX+AYDOcmsvJp0negg2bg3ULm6+I5EpzNnJKjsUqA/jVCadktDTmpdRnCa4s+m8FXrCjwa9PAE4GvuWqJld@lists.infradead.org
X-Gm-Message-State: AFq9FYKggc3IjKTeUTBh1GjiS1o/3FDHqaGnmv237VZqghM2ZEFvh1v/
	nhyVmTugERG5orJgEkiNsDJE9H/O+7bshxVSdRVxPxrkh1tzshxULftdLhx93sa4OMM=
X-Gm-Gg: AYBFou3Q3FHVJhnjH8FVxlCEYkEUmVeNZUS1aebIXdSgsjAI2ASJm4HXoEa1sfl2xCv
	CfCUmFBUDUt8XLGACi2NP+UcJHRrra0Ly7W14NE+acdZAkdGyYH6E7gihLYXCbdCC2Jna5apq2C
	821N1fcnD9UKdsmadQ3TGC6S/d5FujiuhYHPrcy/e6uDMIpF8rLnoOiTVc9i0w+M7RH0b7EkujG
	/TrhpcmvY85aWYT+GPj73FnGpj196txgElAOF7V9trsjTsivyf9AUcrRJ8Zgp3pjjBVO9sNm/J7
	/yVbdAJdm7DEH1o5bkzTlv5XG1PauyY919e3cKje9ZX+PXMqG2A+GMqKZiAVc+nFqMW1P1kOc5K
	yqikZRe/X91KMDljLT+aa6Jpxc/yWxA+L2BGz549YwX1bIWnTEyxI4YsPlXLH7BoUvUMuyFXmmA
	gNSSbVYiHFPgvuU+Ttgrh2iycNScGS4mHjCiaH8UXSwTm3aVeT7I+6BC7YtH+82+CHGBraTn428
	gDkR/T2+adY4ku8iUvQjgdP7SszwJWu5VgoWuuEGCvhqPLa369D08YgVZC84yTlQsGZCC0=
X-Received: by 2002:a05:7301:678f:b0:351:5af1:f53e with SMTP id 5a478bee46e88-3515df405e2mr11468951eec.29.1791486994632;
        Thu, 08 Oct 2026 12:16:34 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm54053eec.20.2026.10.08.12.16.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:16:34 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org
Subject: [PATCH 6.6.y 2/2] firmware: arm_scmi: Unwind TX receiver mailbox setup failure
Date: Thu,  8 Oct 2026 15:16:21 -0400
Message-ID: <20261008191624.98532-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008191624.98532-1-artem@trailofbits.com>
References: <20261008191624.98532-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_121636_584491_DA954228 
X-CRM114-Status: GOOD (  15.35  )
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

From: Sudeep Holla <sudeep.holla@kernel.org>

[ Upstream commit 6f7c06744d53dc8e047725d411d7f915d9ec35ae ]

mailbox_chan_setup() can request an additional unidirectional TX
receiver channel after successfully acquiring the primary channel. If
that second request fails, the function returns immediately and leaves
the primary channel allocated.

Unwind the primary mailbox channel before returning the error so probe
deferral or other setup failures do not leave the channel busy for later
probe attempts.

[ Backport to 6.6.y: apply the same failure unwind to the pre-transport-
  split mailbox source. ]

Fixes: 9f68ff79ec2c ("firmware: arm_scmi: Add support for unidirectional mailbox channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://patch.msgid.link/20260714-scmi_core_fixes-v6-13-3afe499d46e3@kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 2 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-93083. The receiver-mailbox setup can fail
after callbacks become reachable; the unwind has real effect, but it is
safe only after channel setup state is published in the order fixed by
CVE-2026-93093.
This needed a target-specific adjustment; I called it out in the bracketed
backport note above.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.

 drivers/firmware/arm_scmi/mailbox.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/mailbox.c b/drivers/firmware/arm_scmi/mailbox.c
index 80b67f46a4d1..a34a3c693e15 100644
--- a/drivers/firmware/arm_scmi/mailbox.c
+++ b/drivers/firmware/arm_scmi/mailbox.c
@@ -230,14 +230,17 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
 		if (IS_ERR(smbox->chan_receiver)) {
 			ret = PTR_ERR(smbox->chan_receiver);
+			smbox->chan_receiver = NULL;
 			if (ret != -EPROBE_DEFER)
 				dev_err(cdev, "failed to request SCMI Tx Receiver mailbox\n");
-			return ret;
+			goto err_free_chan;
 		}
 	}
 
 	return 0;
 
+err_free_chan:
+	mbox_free_channel(smbox->chan);
 err_clear_cinfo:
 	cinfo->transport_info = NULL;
 	smbox->cinfo = NULL;
-- 
2.39.5


