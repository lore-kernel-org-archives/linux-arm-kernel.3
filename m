Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068BCC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 23:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Etb4UD6KqWxQem0MdhNJMYQBBrscnivKN90g3gZa3fM=; b=FmppPpf0iYlg+JPgD50oV3WtNJ
	HbWCNyMevujBGaB29e/NgdT7Nz5LODpVzpJu4OQRcQDtNWUj2H85UcFnopa4sz0IhfYfiqEGtM3lJ
	9Megmqt7ah5f7Epremy5fZrT4VblxVbdYRi6dyxA0vlvWOqfMS8iZDS9HNB2QcxgGXgUtEXZMlCYV
	aMriH2NfzrlNv2qU5cdPT44cDaS1hqowgTPQc3f4vDIi1hs8cwIN0eIllJZ+3Whpv47EfqhiGwiFF
	67/BV8uWOEJ07hfdano33WMA6pqUVmQMYztK2O838rt2TZ/cd+O3fzBVEF8gYlyO+JmHwa1PxgSWY
	Nrb/5Sig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWk8E-00000006pkT-15it;
	Tue, 01 Jul 2025 23:11:18 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjUL-00000006mpa-0PV4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 22:30:06 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2efa219b5bbso1128268fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 15:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751409004; x=1752013804; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Etb4UD6KqWxQem0MdhNJMYQBBrscnivKN90g3gZa3fM=;
        b=dg0+nR9108Wx+ajBRopDvkyaeUhkgs9TffIDeFndhvF+9KBCIcavsLHS2+M3vg6auU
         A372QScRw90TSW/WYINxxyCUm6zhhn/R7lPTO+Y249Bnj4ipZ+lmfX5wAKd6xPE1M1zu
         vmcngHf/NNX3Pf0mXal+XBv4UtQGwWI0pgsE20GZtMGEjaRsJH6y2q/lSHFCHg+HmfOI
         sAS/Cxu9yc2SP4aTJPD9GLmy3lYiHHDpZ4X72/EP6BTFqIfhg/sErZVWE+dOe48GGfQf
         QuI3fR0wMwqG1D6DKTbgtagyfJ59tURzz4vYgZ2IkdPZ3oOu0cVU23v3QEsFYM8XMmmG
         fVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751409004; x=1752013804;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Etb4UD6KqWxQem0MdhNJMYQBBrscnivKN90g3gZa3fM=;
        b=DauM5dsBMHLynXaSEAKedNFWBvQhbBxgLF1iu+eiW0fkry0A6+w3xUsSc5onnluZgU
         w2S9FwyEpjKJL5frEulrEO4Px+9Vps2zOEvbrWPB+ngYNNi6J2hVnjlKdXchDPOni9JJ
         tdlBIGasaaoHg2j8gJ9hCggWoHYp8U/FT2lAYLT8l+P1V+ixBYsoQvGhOT72C/4RKOu+
         gnwx0dsv3uXBbsNWF01ulPvFn1G+AMYB5izYPuXotoyyL4TPvjrsA2nxsS+rzu/p+L9i
         KN/QVJHlJ2Cy+W+HSjxGUvb3kfTGzG0i6bLFL9Lpm+PN2Eit+SlQPsnWdcCBDZZMH3Iq
         UwFg==
X-Forwarded-Encrypted: i=1; AJvYcCXW79LVyClP3B7PPgkeD45crGwpcTqG/GYgg2L+FYftfyyV3jHwIbHk/rDl8hizNgtDJNOv6w18zwys1PA2RL2j@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4INPcMyANf82Uri/pMwKL9AjPKqvsyD+ZfLJQC46rka9gH0vk
	1FhJS7VfAUDf9TSEtJatw5ujBtPP2SICNfchtUEFft0/stD6tgEyDXG/xU0K7hj/xd0=
X-Gm-Gg: ASbGncsHlvPfC54ArFMWdj+zdsXAovLlgnYQz3fD+OyZZrw5E+L6rc/FX0z/384ZqCg
	7jW4GQ7cfPGy39ys91XrLEPLpBmkZ+W3MnYnFXVOoZ9OCmGLF2HcCAi/p43Z4ugaK8VdPNsmh4N
	f4bL00BJoIQ7HOxvpQNlL+hMcBgxzmXwR1AwwmvHGlq3e+D3aU1fsLa/OWjE7Q2LBwJdwvLF8B8
	/Af/2NErjnJSP54pqtlF3RtBIMOyry3UZ4/XtCmGm9e+kdsg0MgUrPck1JkgigBCKoQj4A1aoGX
	BMNGW2B56kZsP1YlqWGc6ZT09j+BUNg4dZ3+5N6CYbVR83XCiAwPBWWFCenX3AFbtEV+hw==
X-Google-Smtp-Source: AGHT+IGtlelvTdZBEfLOgu4yc8UC9jO/FagWLMwPc+EiONKKAYKCxJCDRSlYN5VFSZ2lgO/XNp9I/g==
X-Received: by 2002:a05:6870:b603:b0:2ef:14cc:caa8 with SMTP id 586e51a60fabf-2f5a8d1e8cfmr458910fac.3.1751409003574;
        Tue, 01 Jul 2025 15:30:03 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d663:8de8:cafb:14e3])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd4f37065sm3517369fac.21.2025.07.01.15.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:30:03 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:30:01 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] cpufreq: armada-8k: Fix off by one in
 armada_8k_cpufreq_free_table()
Message-ID: <7ae149bf-5e4d-40df-b1c2-31d5ef418f05@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_153005_170270_19B2CBD9 
X-CRM114-Status: GOOD (  13.75  )
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

The freq_tables[] array has num_possible_cpus() elements so, to avoid an
out of bounds access, this loop should be capped at "< nb_cpus" instead
of "<= nb_cpus".  The freq_tables[] array is allocated in
armada_8k_cpufreq_init().

Cc: stable@vger.kernel.org
Fixes: f525a670533d ("cpufreq: ap806: add cpufreq driver for Armada 8K")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cpufreq/armada-8k-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/armada-8k-cpufreq.c b/drivers/cpufreq/armada-8k-cpufreq.c
index 006f4c554dd7..d96c1718f7f8 100644
--- a/drivers/cpufreq/armada-8k-cpufreq.c
+++ b/drivers/cpufreq/armada-8k-cpufreq.c
@@ -103,7 +103,7 @@ static void armada_8k_cpufreq_free_table(struct freq_table *freq_tables)
 {
 	int opps_index, nb_cpus = num_possible_cpus();
 
-	for (opps_index = 0 ; opps_index <= nb_cpus; opps_index++) {
+	for (opps_index = 0 ; opps_index < nb_cpus; opps_index++) {
 		int i;
 
 		/* If cpu_dev is NULL then we reached the end of the array */
-- 
2.47.2


