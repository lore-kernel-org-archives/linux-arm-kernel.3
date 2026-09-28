Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F953CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QcMM/70ueq1BvxYllSAMCDlH687AiK6lQ79IdX64Iy4=; b=gD4rgnPFtbDQ/RwjuVcXdUs8xW
	9jTKxNdvvI23Bnk2/vU86EHF7IVj311Kk8JWbeioFbj1XXvI4kHzM+YQcjS441c37u/SWtJqxgM1i
	1XVmvzoz8e5G8Idah8lkqbQr4sXtSz4MSOg5ioVq/ExohuXEvXHygT2OU2IGHaZVg6Ap+tYZjRLsi
	Kwx99Jv0p9kmz4y3/pwuQDMzhqNQtHzXYoOYgIbLHVMrBloDJ6MFDNU1hvgP/xEwMtspkojZQuKBu
	fIHPTb+zrFrgMxEjjSAdI9sNnALLJJYWkNqgTYX3mliVcaHp+xaNTKayLw+8xjMHvX7aS983cH80V
	CXQRMSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFHC-00000001BRV-0Hnd;
	Mon, 28 Sep 2026 17:36:30 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFH8-00000001BPr-3rvl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:36:28 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so1779710a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790616985; x=1791221785; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QcMM/70ueq1BvxYllSAMCDlH687AiK6lQ79IdX64Iy4=;
        b=OP7Ncbw1azz0PwmYRVx7NEEsEz7CBwaRTn0/RdYiB7an3qXzt9RxmcXwbe2JVZwhyR
         yTQ8nVXMYSrk3FRPWvvUVc3y9n1b3X6HDB+HP9nEMxelq4Q5niayfeY89O89O3vegSZA
         IyF8WtfrwB9oS5TijYnYEkKRt4bKb7ojckMh9gIll7EMf6fXrV7D6M09NN6mzgV+DCGZ
         rmg+K8mxAq2+4ncK9YkdF5sAZT3OqpydbD9cK4ZQ3KjpM/OXXTpgNgFsmy1DqytR+fjf
         BHlxzAdXFFkDuG5YsclZUPLwy17PnuAxYYg0VotG2Btllc6dOxt+H8/GuC1/XIXBpM3I
         m9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616985; x=1791221785;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QcMM/70ueq1BvxYllSAMCDlH687AiK6lQ79IdX64Iy4=;
        b=VtMdNtngf10lg6klqP/S7fEpcNd4nLLVmhMbubVZM6Hta3ppS8ONxO/Y4gp2Iw9bYW
         9JhVTN9WzptaD3PyDjSRPZtcQo+eQ0lqN7klJtNlOYw+aacZJJO90UpMKLEqsyaq4vTx
         +zlsbhqIthbbD1YfrpebOBeFKbfRXNN9pZEFsX8vA823bFEE8Q9ubKkvy9gFhgwLtX/q
         fTQK05+K8QmLuafogQOiWVwENGVjG9b7FqSueAgu61fSU6vHKTAfRFR0+IIZmfcYiPcn
         /Ch3MNNQ3aQ9W1D4tQfbkjkmm86vCPzg6hheAx3bRiAIoGAFU9KyWu+++sRoV8Q3+LkH
         /4JQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/qBf1a3oPlbo6NQs7fhWiLklEtF6m0bCT5k9wNIhVddmyMOm8TbS7cOD5gCGixq9h0Bu3cjtHRs0GnUb8Rncp@lists.infradead.org
X-Gm-Message-State: AFq9FYLKGfb/LNWoHCXImkJBKrKDekpq1EmlljSnCV1ynyM4vymZc1lB
	tdx5VzHVnwphgr6o2q08odXS/xZaBf/x4pOdDYYr0JXd5kzKxR6aN5g00m6vEJtAnik2X7nZb0m
	CujqH
X-Gm-Gg: AYBFou1VhBt1vmFH623CEF/vAzLrJRKy/1x9nWd3u76dzH82ZVDGj+sIB5Vx8ZN4nKx
	TmbMcNwFyDuEtUljt0PkTUe4GLNhXmV66dFqqyQpBs3/IWNuDeHVTZDFJfH3fyFKguluk7+cnTD
	tzQOeUBSvNU3sVTMi3Ki3FVMzaNC2TuUt9vvXutZycSMVKZRo80AFJiFbZ1NDlURIa3vlANwCFE
	jI4ZdqNOYboeqW2/w0CgkEO08nOyZKs4MBGG1kxIlfDTZQwZXomBtCjTJWTspdCt8wwzl3p+LXu
	02eLknbMU+1+6/BuWFJFWMmxkU4tUA7Mre+DKUo/QzG0h57mCpEm4k5IQCrzBflKb0t1+jc8s/V
	HdjvboU3eFCve3REbZTjCBnNX+omQ8/j+UpAS1U7dgOSyB3jOn05r7i/iqWc3R6wGsnm6Kn4fTN
	bs3kv53Ms6X8HvaCcczjFtW/dg6xQN4N9/V6wKngaNtB5mMRxlzNYwPyFMsREYCxio0y0=
X-Received: by 2002:a17:90b:4cc4:b0:3a0:ace4:d2a9 with SMTP id 98e67ed59e1d1-3a0ace4d746mr9210271a91.64.1790616985559;
        Mon, 28 Sep 2026 10:36:25 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2df91409040sm46157205ad.41.2026.09.28.10.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:36:25 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP fixes for v7.3-rc
Date: Mon, 28 Sep 2026 10:36:24 -0700
Message-ID: <7hecedb7mv.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_103627_001507_C4197EC7 
X-CRM114-Status: UNSURE (   8.38  )
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/fixes-signed

for you to fetch changes up to 2fabd2f406d0cf787be47b3bbeea99b30004033d:

  ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider definition (2026-08-31 09:54:09 -0700)

----------------------------------------------------------------
ARM: dts: OMAP fixes for v7.3-rc
- ti/omap: dra7: fix PCIe PHY clock divider definition

----------------------------------------------------------------
David Oberhollenzer (1):
      ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider definition

 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

