Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A140D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zXwAvU705aOAOAu5VxWMi2RxSodq3/VIqQ5cCCgEPB4=; b=1V2eXs3Kh4UG1XPdT0i+lkenL9
	XE2neQtrOazanIGSOGrasiYaFi5w+1MEjL2sd4aO6OZ+judin6wV4spJYoDnL81I47myNxNFHb2Ug
	QeRk/x/K/elVoHUsEjpj+18eLdEzXTLFRGduji6BzetNjxsrgQZq32OivvQeTMwHQ2n8eKrpzCy2i
	2hvaf8Qr3xCDC+JwSU6aeTjRAUMasWMmsL9OO+g59MHyfJLx6KXjny8wNAACTX/wY0EWCAZ4PkUxb
	cEIbO2I1Yxrt0YH8i9GG0EQXxLPtGrlfRgXKMF0asXvDIgfs/LE1ZuLaZ+3jBGnIbno2SkVW3U0mo
	lPNP7dJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OAc-0000000AXaf-2L0q;
	Fri, 08 Nov 2024 12:32:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9O5r-0000000AWUx-0Ie7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 12:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731068881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=zXwAvU705aOAOAu5VxWMi2RxSodq3/VIqQ5cCCgEPB4=;
	b=aar4eLAppJPAFk+YaGbOEKyt/Vagjr/Eo+ZemJ8zPkmuzrDlx7/v6qtpzqJa6Douj5jt1c
	FSXqI22syniHpzTQh4jEDpbb2mSlDyT1QrVVecvHlkoisZ/uAaUSdXKVqASr+32IQ5rMMC
	LyFI9p5ExEgOLsOCCJN+BCf1qLjwnxw=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-MkHPdZWBPWmj9nV-x8leAA-1; Fri, 08 Nov 2024 07:26:23 -0500
X-MC-Unique: MkHPdZWBPWmj9nV-x8leAA-1
X-Mimecast-MFC-AGG-ID: MkHPdZWBPWmj9nV-x8leAA
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3e65ee7154bso150959b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 04:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731068783; x=1731673583;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zXwAvU705aOAOAu5VxWMi2RxSodq3/VIqQ5cCCgEPB4=;
        b=d194sGNEQP0lh5vHnlZ5UYlmOXOOxdYeIbiBkOemhN+lKohLrQIagIxZfF/AMU9wvt
         KmbjnxTXLHbe9weYcFfJJ6oOYSIB7I0PY8LSMRNOKP2ggH9hvrNQWBzLswWs/1+Vpau+
         LC7Ip297c4PHwb++46CaKGYMT3+t6ogsCXBOPLXtaM2DXn029mibklOk19aYhzzLyO+T
         elJH+asri93tPXBSN8i3yoe27Mh7FxP3SLlJWYlcwzffYSD8YcefczKnmuzX9cqxCB19
         J+wE92vQuhJFN+NensvaTSsu1Om2ST83DjZUWB9cOXNH6YeU/IztPDVbGCs40fegoIIg
         US/w==
X-Forwarded-Encrypted: i=1; AJvYcCVOufYhfMeyU8rNe39qK4eRxEc/XBLubiOsDA8Pwp/6iZcuMwQZ/7t22tsQLjTz2GL2J2V2XV+aSeeQ/ZXnIQ6s@lists.infradead.org
X-Gm-Message-State: AOJu0YwVcV116xAra66sL9eA8v/CoFwA08dRtweaayhUlToxAmmXlbvP
	GbjLADAeUHLoerkxZLLQsNs1b2ENZPMSVO4ihpYN0LLtJfQMEG8BsWusAy01h2tTy4QxjHaUyJ9
	W27MH6z7yk1EpIuAMz3oqxuTLtt/0hMkwMJjvspod1FvfZitlWzHWWJy8ArRMIsRBEEfTq2qPFl
	Fr+zIw1E9w0OeRhnn2XO7PrBAaANeQgSQTjGqBE/v/ctojqqc=
X-Received: by 2002:a05:6808:bd6:b0:3e6:49e0:f16b with SMTP id 5614622812f47-3e79464ffbemr561212b6e.1.1731068783031;
        Fri, 08 Nov 2024 04:26:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDh9xZLbDlbWxWwt0Ee/VQnmLbaHr7eXwqcgUZluZ+iMr9vgrajudEgifQ9sAYdMtcBXTBSmyV5BbZCxOsCjU=
X-Received: by 2002:a05:6808:bd6:b0:3e6:49e0:f16b with SMTP id
 5614622812f47-3e79464ffbemr561207b6e.1.1731068782692; Fri, 08 Nov 2024
 04:26:22 -0800 (PST)
MIME-Version: 1.0
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Fri, 8 Nov 2024 13:26:12 +0100
Message-ID: <CALE0LRvJ-n77oU=O9__NdSLw2v33zMK+WYkn2LcwWMwHCbohQw@mail.gmail.com>
Subject: optee-based efi runtime variable service on TI j784s4 platforms
To: Ard Biesheuvel <ardb@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Masahisa Kojima <masahisa.kojima@linaro.org>, 
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	Manorit Chawdhry <m-chawdhry@ti.com>, Udit Kumar <u-kumar1@ti.com>, "Menon, Nishanth" <nm@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3qvKUmkNdXVrrwS2u9hNWD2RtP_j8EjvpgRiqX9K8iY_1731068783
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_042803_193633_75B7550F 
X-CRM114-Status: GOOD (  10.83  )
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

Hi all,

I'm looking for any advice/clue to help me to progress on enabling
TEE-base EFI Runtime Variable Service on TI a j784s4 platforms.

I basically followed the steps described in u-boot documentation [1],
I enabled some debugging messages but I think I'm at the point that
the problem might be in the StandaloneMM application, and I'm not sure
how to debug it.

What I see is that when I run the tee-supplicant daemon, it looks like
the tee_client_open_session() call loops forever and the tee_stmm_efi
driver never ends to probe.

With debug enabled I got the following messages.

# tee-supplicant
D/TC:? 0 tee_ta_init_session_with_context:557 Re-open trusted service
7011a688-ddde-4053-a5a9-7b3c4ddf13b8
D/TC:? 0 load_stmm:297 stmm load address 0x40004000
D/TC:? 0 spm_handle_scall:859 Received FFA version
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request

And tracing the function calls gives me that:

      tee_stmm_efi_probe() {
             tee_client_open_context() {
               optee_get_version() {
                 tee_get_drvdata(); (ret=0xffff000002e55800)
               } (ret=0xd)
               tee_ctx_match(); (ret=0x1)
               optee_smc_open() {
                 tee_get_drvdata(); (ret=0xffff000002e55800)
                 optee_open() {
                   tee_get_drvdata(); (ret=0xffff000002e55800)
                 } (ret=0x0)
               } (ret=0x0)
             } (ret=0xffff000004e71c80)
             tee_client_open_session() {
               optee_open_session() {
                 tee_get_drvdata(); (ret=0xffff000002e55800)
                 optee_get_msg_arg() {
                   tee_get_drvdata(); (ret=0xffff000002e55800)
                   tee_shm_get_va(); (ret=0xffff000002909000)
                 } (ret=0xffff000002909000)
                 tee_session_calc_client_uuid(); (ret=0x0)
                 optee_to_msg_param(); (ret=0x0)
                 optee_smc_do_call_with_arg() {
                   tee_get_drvdata(); (ret=0xffff000002e55800)
                   tee_shm_get_va(); (ret=0xffff000002909000)
                   tee_shm_get_va(); (ret=0xffff000002909060)
                   optee_cq_wait_init(); (ret=0xffff000002e55910)
                   optee_smccc_smc(); (ret=0xffff0004)
                   tee_get_drvdata(); (ret=0xffff000002e55800)
                   optee_smccc_smc(); (ret=0xffff0004)
                   tee_get_drvdata(); (ret=0xffff000002e55800)
                   optee_smccc_smc(); (ret=0xffff0004)
                   tee_get_drvdata(); (ret=0xffff000002e55800)
                   optee_smccc_smc(); (ret=0xffff0004)
                   tee_get_drvdata(); (ret=0xffff000002e55800)
                   optee_smccc_smc(); (ret=0xffff0004)
     ... continues sending this forever ...
     ... Hit ^C to stop recording ...
                   tee_get_drvdata(); (ret=0xffff000002e55800)
                   optee_smccc_smc() {

[1] https://docs.u-boot.org/en/latest/develop/uefi/uefi.html#using-op-tee-for-efi-variables

Thanks in advance,
   Enric


