Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E659FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 19:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/Ooxzr6FEZjkJX+l+du1+RJ2WQpB3zFWntZewkgHGM=; b=ihRJWu4bJUVfzyjN/4HGMjkJ0D
	uk35p2tLgQiKpnk4nm0B0nsSGQGu4eSAsv1rKJpE3Asx8v/an7QLaWCSI8aX0EzeB6IFQNzhNoGU8
	YQicz/jBKCYxBMrKiWjxds0Fr+Ynbx6ZdynC2FCrpapYIs/PvSS+g7seljt1kcpZhhNX0tb70BZ/C
	tbad68RytkZx6qEI6kudTrcgHVb5YbECynRJmhQIAWi4D/PYTxyiUjBuMBEW9/I/ZNDYmWe5jsZwU
	iHwo+KABL54zpOIcdLvR4gEaG89LcjYW8P4S4dUfJ44QLDHU62X0uy766C8BjuPD1Ks5/jhsJ6DC5
	a5DDN/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKUG-0000000BLQK-2Hda;
	Sat, 16 May 2026 19:15:48 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKUD-0000000BLPN-2z2O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 19:15:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-44509921fbcso436547f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 12:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958944; x=1779563744; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/Ooxzr6FEZjkJX+l+du1+RJ2WQpB3zFWntZewkgHGM=;
        b=cwJF/OlHF6WnM7sKskgNA40LXeHrhawjyJkFaAq6wv1N28MpmToyEPcMPgQw2vTqh3
         V44jilavKl0i4Vc4zLSSR9YU/k7cjEiHDIka65Bxq61RLKLt7DWtHZk8qm5v9HRG1JMZ
         QQ3+BK+EJs/KRdARKcnuBBL0/gIodXoyUhTeCrYZTkPakO4jeVwEb3TxzoRSbGcTJPmd
         PY+KS5lKStuAG+Wngh5CBPqJkDmsVBGSgfduDTKqUKtJ8SHlKZrTB8Lco1N1uWDM+ajO
         BLkTd29Nowmb0R5tfDW2d97AXyyE1TQ8hdbeJYcUVQKOjY+EiGFuh0ZFFQvTszw+ywhu
         /ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958944; x=1779563744;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/Ooxzr6FEZjkJX+l+du1+RJ2WQpB3zFWntZewkgHGM=;
        b=g9aiQy5tuh71S0BncxSb59kRMEcC7odiIIADmOFw/fTThRiN+vyJEYERzvazuIeZ1r
         +RWoReiLJaaUzqyEYQx/du5ycXUJGUCeomdLpDlZiTMWocwosLCsgZpXB5lJnzeTfaDD
         RWsCsohkMoJXflcOl2fmgnoaeWzj/FAdoSQj9Pb096d/JB+4WfVpwUizt9qNckh0QMQf
         9+6Lx/wSQ3OGemGYR7FCeLxUVZuvdmtIU8CXdBUqGv0FSVKi4q2SjXgubZeuozbxeQ3l
         tvb80grnJ8KR7fzmprecq7OAV7B8nhdpJUwb2XH4SllAEbPmPtcFlOBFeBHI2kXXNCCB
         Z8Hg==
X-Forwarded-Encrypted: i=1; AFNElJ/AawCSQY+Z5AtjBb0QE2XJ1ywQJnkbjjbsTc/yIhjHN2kjS4J+4UJ0Y25hSh7c5w5RR8xH8GdS/iYbVnidJKag@lists.infradead.org
X-Gm-Message-State: AOJu0YwYuz1tuQcrpnk9O3mOhPvZ7O5EQzr6CYsxP7xgttkuPhIMYV9g
	9QI+lWv91SjzykRsvLma3WpBCMXMkdxIyMKZgmTY5VbmpKRSEQXymWM=
X-Gm-Gg: Acq92OFoXjGlW2Mfkz2ohdcL+r4ePIXCiCtZq7uf2UFyMc9YejoNevOzgAj+GeYzFGP
	j6JXAuRl33DTwP79T2V7Nt2THdqF84+bQQAbkVSc6D+7iNNIcJZ05WoPogorufCva7nsjNF7WlB
	082cLrspOsMDWkylF1KgJSGIhJ8vE6Ht8aiW3xk7N/nhf0mKNEFzZCfd7P+DmWfpTA6Vu/F5otG
	Jjf/wnCNZLYCApxCj8cF9TwsYlawtNuymXSS419S6bCQ8E30KEb3g31iDPDGb6PtB76HN8++GVa
	1Ssz9fr2rjeBM5GeUkPcSryORJVKo293xzeJ3Lt5MCKQnMNfkQ+Na6jO4t2+68CcFjTQytcxxXF
	arxs2VEoVlQJolbVnUf5ge5JTDTUwLTsWg44SidDxDaUjf6oFxolS8Nrg2JtMRtt2fw==
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:c3f9 with SMTP id 5b1f17b1804b1-48fe661df4dmr117083015e9.31.1778958943323;
        Sat, 16 May 2026 12:15:43 -0700 (PDT)
Received: from debian ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm23663118f8f.20.2026.05.16.12.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:15:42 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: shivamkalra98@zohomail.in
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, luiz.von.dentz@intel.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: btmtk: Fix FUNC_CTRL parsing for devices with
 zero-length payloads
Date: Sat, 16 May 2026 19:15:42 -0000
Message-ID: <177895894204.2999813.16690091301048694150@gmail.com>
In-Reply-To: <20260514-bluetooh-fix-mt7922-v1-1-499c878af1e5@zohomail.in>
References: <20260514-bluetooh-fix-mt7922-v1-1-499c878af1e5@zohomail.in>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_121545_748563_E74DF478 
X-CRM114-Status: UNSURE (   6.65  )
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

On Thu, 14 May 2026 23:18:13 +0530, Shivam Kalra wrote:
> Fix this by making skb_pull_data() conditional: if the status payload is
> present, parse it as before; if omitted, default to BTMTK_WMT_ON_UNDONE.

Makes sense. The original check was too strict for devices that
legitimately omit the status field on FUNC_CTRL responses.

Reviewed-by: Tristan Madani <tristan@talencesecurity.com>

