Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF0DCF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slnZKLktel7FGULom0AhklQ/3aJdt8tuo66g65NOCPI=; b=1SzQzphw/MHHST5sYD14NV9D3n
	tKVjeDUXGQNz2HBXOYRA+JD9UpKfACVqqlD+IE9wXEJondb4J/wI84Ck904fJYVJKLJNJ05ptVjRQ
	XkYeTNlogCDsPiT17gG3/CM4d0HlQeiYQWyx/z3TIV1eVfYPMqDN3fwVGXnnxO4mA1cxwBre1Q8ey
	UZhwa9+NgO7mUSXEhRNg1vKrp+u2qgL2w56Zs0SXjexW5gFoI68cP/JPCsfXJn7rNE+IPTbynjNO/
	VSvhqKBG15Bq6//W4gyy+F4KATvw5yFHHMH5T/ANvYX9nuQJMW5vLeLy1BMFj+nrEZsViZLa9Rmiq
	kKikvXgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNX-00000003WXt-30bq;
	Wed, 19 Nov 2025 15:45:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNH-00000003WEj-46kT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42b3108f41fso4232449f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567138; x=1764171938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slnZKLktel7FGULom0AhklQ/3aJdt8tuo66g65NOCPI=;
        b=sGZcVNSf//F0ST2zlmHyxZNvsLQZS2346+1YPMayaWbhCrpAeMp9WSle/PwNdLByFy
         mW4C8RzR08sfPKUNnLm/HoxJHTMP83czr7+IX3lWaAGn4/OPLF6neuhnHeThc4zc3rPI
         EIv2kC3An4Y9QSv40pICfef5DodWY+d33MCKU4Nc35gSLWrl2iZGR1MerTYacLElfKBq
         1P6K9FMpjxykgo9XrgvetE0/bqu6glP0dCMyfIQQ1pmWJ5/WvULyGFnGSRw34h8B2Wk+
         KR34T8FNrYwTOUM6oBl/POGFEwWkhxj5osWO7y+JQO0NMMI/SIM9/MdZWg3mkwFGgnoT
         VLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567138; x=1764171938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slnZKLktel7FGULom0AhklQ/3aJdt8tuo66g65NOCPI=;
        b=TNXMBOorGpJ7aOYO7k/Kp7pjURD1gXBl6PoRw7W/5V8OW86QDmYdHYkFjB8wQJoFOR
         nC7TM3mk9rSwv73/JpbIBwNUECriTEY8tklskBMrHjQagrnZCxwKJI/kkAL+lFaR+na9
         YwsLpB9JUmgzlOvZInGQaheLxsg4NE4pOb0ltMOKL+OEgHXuTzY3EtnGMQnjcsFyw71t
         FylJiJeMFSm7Ygi4w/+zvx06G+Qn3kzLU/28kXmTENCZajNRUGOQy+NB6Dxp2kAVH6fL
         7W8wQMM0nBj0qapglAlYx1uCbZPO7Ncz/Q42f1wHXmPMLrU57464KphGoTyyuOYdUv5a
         hONw==
X-Forwarded-Encrypted: i=1; AJvYcCUYPiOfrjZTowvyH1HVnX7L10aJPoMF4Qv/LqQslNoXBcIgQJCg0dJaWlSLVkejXve1iR4SiTDInjPiPTsL+UIv@lists.infradead.org
X-Gm-Message-State: AOJu0YyEPoH5KoHeDV8PzLAgxehW3ISw/Of27JBeZ1bcqWUdmqDVYT1C
	KKfWMku6lVDwWYhjNNRZhSgNav4ikgLJpNbg+BnhgEoUTktNjB7u/M43U3Z8yUnKd0Q=
X-Gm-Gg: ASbGncusu9dwXTusDql3bjKkj6N0W0hh/GbuPz08PLf+v6BcWh1ZHBI+6E8I1Q/7mTs
	nRQXC7gfKlCI7lFGHRBz/1QYJr1tailmZUpOvEmbPWvpclI5axCapTGI/F/6yymoGhYOHsrBDrj
	qyZgK9TP+PsqIDKmJjE3w2XkDds8lO4+h3MUssKhhxKd1bG1DwWMR3B+A+8Bk1A38NCvnFeHQeZ
	w4uRk3QYFDZMbw4sFoKrroIQBI+treqJiGyVdQzImat+julJDZbnuh3WlRDOiJFP5vpgp3F+cdh
	/VMN904GltXAzanrvxAoE00SPw5GifOvpXKv3weQR6LLNCL+lvah1y5Lyoq6uLyRMqKRBqDDNkB
	aSr5Gt/OPus2vZI3p4KGN3P5q3aO+yLJ5B3aLgS+LCGcdWWG8BIbI2mJ5aRawxCf4eIe0/vwu0Q
	+t6mYZ6wYyd752iXY9K1jjuxL/R/hYGhIBCWGTeCNB
X-Google-Smtp-Source: AGHT+IH9XA5XKwB+eYd4P52AVjjtUkCjRx7TcK6UtIfvF/aP3IOPVELnIO3YhYk8yezAw62YpuQ83g==
X-Received: by 2002:a5d:64e7:0:b0:42b:47da:c313 with SMTP id ffacd0b85a97d-42b593395a0mr22250899f8f.3.1763567137600;
        Wed, 19 Nov 2025 07:45:37 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:37 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 12/26] kernel/configs: Register dynamic information into meminspect
Date: Wed, 19 Nov 2025 17:44:13 +0200
Message-ID: <20251119154427.1033475-13-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074540_060468_32F68C22 
X-CRM114-Status: GOOD (  12.71  )
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

Register kernel_config_data information into inspection table.
Debugging tools look for the start and end markers, so we need to capture
those as well into the region.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/configs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/configs.c b/kernel/configs.c
index a28c79c5f713..139ecc74bcee 100644
--- a/kernel/configs.c
+++ b/kernel/configs.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/uaccess.h>
+#include <linux/meminspect.h>
 
 /*
  * "IKCFG_ST" and "IKCFG_ED" are used to extract the config data from
@@ -64,6 +65,11 @@ static int __init ikconfig_init(void)
 
 	proc_set_size(entry, &kernel_config_data_end - &kernel_config_data);
 
+	/* Register 8 bytes before and after, to catch the marker too */
+	meminspect_lock_register_id_va(MEMINSPECT_ID_CONFIG,
+			     (void *)&kernel_config_data - 8,
+			     &kernel_config_data_end - &kernel_config_data + 16);
+
 	return 0;
 }
 
-- 
2.43.0


